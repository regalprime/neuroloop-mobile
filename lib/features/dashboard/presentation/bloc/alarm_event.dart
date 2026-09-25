part of 'alarm_bloc.dart';

sealed class AlarmEvent extends Equatable {
  const AlarmEvent();

  @override
  List<Object?> get props => [];
}

final class AlarmScheduleTypeChanged extends AlarmEvent {
  const AlarmScheduleTypeChanged(
    this.type,
  );

  final AlarmScheduleType type;

  @override
  List<Object?> get props => [type];
}

final class AlarmTimeChanged extends AlarmEvent {
  const AlarmTimeChanged(
    this.time,
  );

  final TimeOfDay time;

  @override
  List<Object?> get props => [
        time.hour,
        time.minute,
      ];
}

final class AlarmDurationChanged extends AlarmEvent {
  const AlarmDurationChanged(
    this.duration,
  );

  final Duration duration;

  @override
  List<Object?> get props => [duration];
}

final class AlarmScheduleRequested extends AlarmEvent {
  const AlarmScheduleRequested();
}

final class AlarmCancelRequested extends AlarmEvent {
  const AlarmCancelRequested(
    this.alarmId,
  );

  final int alarmId;

  @override
  List<Object?> get props => [alarmId];
}

final class AlarmQuickAlarmToggled extends AlarmEvent {
  const AlarmQuickAlarmToggled(
    this.minutes,
  );

  final int minutes;

  @override
  List<Object?> get props => [minutes];
}

final class AlarmExactPermissionSettingsRequested extends AlarmEvent {
  const AlarmExactPermissionSettingsRequested();
}

final class AlarmNotificationPermissionRequested extends AlarmEvent {
  const AlarmNotificationPermissionRequested();
}