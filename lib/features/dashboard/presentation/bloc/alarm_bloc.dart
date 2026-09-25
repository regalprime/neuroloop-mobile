import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:neuroloop/features/dashboard/data/repositories_impl/alarm_repository_impl.dart';
import 'package:neuroloop/features/dashboard/domain/entities/alarm.dart';
import 'package:neuroloop/features/dashboard/domain/enums/alarm_schedule_type.dart';
import 'package:neuroloop/features/dashboard/domain/usecases/cancel_alarm.dart';
import 'package:neuroloop/features/dashboard/domain/usecases/open_exact_alarm_settings.dart';
import 'package:neuroloop/features/dashboard/domain/usecases/request_notification_permission.dart';
import 'package:neuroloop/features/dashboard/domain/usecases/schedule_alarm.dart';

part 'alarm_event.dart';
part 'alarm_state.dart';

final class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc({
    required ScheduleAlarmUseCase scheduleAlarmUseCase,
    required CancelAlarmUseCase cancelAlarmUseCase,
    required OpenExactAlarmSettingsUseCase openExactAlarmSettingsUseCase,
    required RequestNotificationPermissionUseCase requestNotificationPermissionUseCase,
  })  : _scheduleAlarmUseCase = scheduleAlarmUseCase,
        _cancelAlarmUseCase = cancelAlarmUseCase,
        _openExactAlarmSettingsUseCase = openExactAlarmSettingsUseCase,
        _requestNotificationPermissionUseCase = requestNotificationPermissionUseCase,
        super(const AlarmState()) {
    on<AlarmScheduleTypeChanged>(
      _onScheduleTypeChanged,
    );

    on<AlarmTimeChanged>(
      _onTimeChanged,
    );

    on<AlarmDurationChanged>(
      _onDurationChanged,
    );

    on<AlarmScheduleRequested>(
      _onScheduleRequested,
    );

    on<AlarmCancelRequested>(
      _onCancelRequested,
    );

    on<AlarmQuickAlarmToggled>(
      _onQuickAlarmToggled,
    );

    on<AlarmExactPermissionSettingsRequested>(
      _onExactPermissionSettingsRequested,
    );

    on<AlarmNotificationPermissionRequested>(
      _onNotificationPermissionRequested,
    );
  }

  final ScheduleAlarmUseCase _scheduleAlarmUseCase;

  final CancelAlarmUseCase _cancelAlarmUseCase;

  final OpenExactAlarmSettingsUseCase _openExactAlarmSettingsUseCase;

  final RequestNotificationPermissionUseCase _requestNotificationPermissionUseCase;

  void _onScheduleTypeChanged(
    AlarmScheduleTypeChanged event,
    Emitter<AlarmState> emit,
  ) {
    emit(
      state.copyWith(
        scheduleType: event.type,
        status: AlarmStatus.editing,
      ),
    );
  }

  void _onTimeChanged(
    AlarmTimeChanged event,
    Emitter<AlarmState> emit,
  ) {
    emit(
      state.copyWith(
        selectedTime: event.time,
        status: AlarmStatus.editing,
      ),
    );
  }

  void _onDurationChanged(
    AlarmDurationChanged event,
    Emitter<AlarmState> emit,
  ) {
    emit(
      state.copyWith(
        duration: event.duration,
        status: AlarmStatus.editing,
      ),
    );
  }

  Future<void> _onScheduleRequested(
    AlarmScheduleRequested event,
    Emitter<AlarmState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AlarmStatus.scheduling,
        errorMessage: null,
      ),
    );

    try {
      final alarm = _createAlarm();

      await _scheduleAlarmUseCase(alarm);

      emit(
        state.copyWith(
          status: AlarmStatus.scheduled,
          scheduledAlarmId: alarm.id,
        ),
      );
    } on ExactAlarmPermissionException {
      emit(
        state.copyWith(
          status: AlarmStatus.failure,
          permissionStatus: AlarmPermissionStatus.required,
          errorMessage: 'Exact alarm permission is required.',
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AlarmStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _onQuickAlarmToggled(
    AlarmQuickAlarmToggled event,
    Emitter<AlarmState> emit,
  ) async {
    final minutes = event.minutes;
    final isEnabled = state.isQuickAlarmEnabled(minutes);

    if (isEnabled) {
      await _disableQuickAlarm(
        minutes,
        emit,
      );
      return;
    }

    await _enableQuickAlarm(
      minutes,
      emit,
    );
  }

  Future<void> _enableQuickAlarm(
    int minutes,
    Emitter<AlarmState> emit,
  ) async {
    final alarmId = _createQuickAlarmId(minutes);

    final alarm = Alarm(
      id: alarmId,
      type: AlarmScheduleType.afterDuration,
      scheduledAt: DateTime.now().add(
        Duration(minutes: minutes),
      ),
      title: 'NeuroLoop',
      body: 'Time to focus',
    );

    try {
      await _scheduleAlarmUseCase(alarm);

      final enabledQuickAlarms = {
        ...state.enabledQuickAlarms,
        minutes,
      };

      final quickAlarmIds = {
        ...state.quickAlarmIds,
        minutes: alarmId,
      };

      emit(
        state.copyWith(
          status: AlarmStatus.scheduled,
          enabledQuickAlarms: enabledQuickAlarms,
          quickAlarmIds: quickAlarmIds,
          errorMessage: null,
        ),
      );
    } on ExactAlarmPermissionException {
      emit(
        state.copyWith(
          status: AlarmStatus.failure,
          permissionStatus: AlarmPermissionStatus.required,
          errorMessage: 'Exact alarm permission is required.',
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AlarmStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _disableQuickAlarm(
    int minutes,
    Emitter<AlarmState> emit,
  ) async {
    final alarmId = state.getQuickAlarmId(minutes);

    if (alarmId == null) {
      return;
    }

    try {
      await _cancelAlarmUseCase(alarmId: alarmId);

      final enabledQuickAlarms = {
        ...state.enabledQuickAlarms,
      }..remove(minutes);

      final quickAlarmIds = {
        ...state.quickAlarmIds,
      }..remove(minutes);

      emit(
        state.copyWith(
          status: AlarmStatus.canceled,
          enabledQuickAlarms: enabledQuickAlarms,
          quickAlarmIds: quickAlarmIds,
          errorMessage: null,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AlarmStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _onCancelRequested(
    AlarmCancelRequested event,
    Emitter<AlarmState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AlarmStatus.canceling,
        errorMessage: null,
      ),
    );

    try {
      await _cancelAlarmUseCase(
        alarmId: event.alarmId,
      );

      emit(
        state.copyWith(
          status: AlarmStatus.canceled,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AlarmStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _onExactPermissionSettingsRequested(
    AlarmExactPermissionSettingsRequested event,
    Emitter<AlarmState> emit,
  ) async {
    try {
      await _openExactAlarmSettingsUseCase();
    } catch (error) {
      emit(
        state.copyWith(
          status: AlarmStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _onNotificationPermissionRequested(
    AlarmNotificationPermissionRequested event,
    Emitter<AlarmState> emit,
  ) async {
    try {
      await _requestNotificationPermissionUseCase();
    } catch (error) {
      emit(
        state.copyWith(
          status: AlarmStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Alarm _createAlarm() {
    return Alarm(
      id: DateTime.now().millisecondsSinceEpoch,
      type: state.scheduleType,
      scheduledAt: _calculateScheduledAt(),
      title: 'NeuroLoop',
      body: 'Time to focus',
    );
  }

  DateTime _calculateScheduledAt() {
    final now = DateTime.now();

    switch (state.scheduleType) {
      case AlarmScheduleType.afterDuration:
        return now.add(state.duration);

      case AlarmScheduleType.specificTime:
        final selectedTime = state.selectedTime;

        if (selectedTime == null) {
          throw const FormatException(
            'Please select an alarm time.',
          );
        }

        var scheduledAt = DateTime(
          now.year,
          now.month,
          now.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        if (!scheduledAt.isAfter(now)) {
          scheduledAt = scheduledAt.add(
            const Duration(days: 1),
          );
        }

        return scheduledAt;
    }
  }

  int _createQuickAlarmId(int minutes) {
    return 100000 + minutes;
  }
}