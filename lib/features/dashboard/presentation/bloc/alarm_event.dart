part of 'alarm_bloc.dart';

sealed class AlarmEvent extends Equatable {
  const AlarmEvent();
}

final class AlarmTimeSelected extends AlarmEvent {
  final DateTime scheduleAt;

  const AlarmTimeSelected({required this.scheduleAt});

  @override
  List<Object?> get props => [scheduleAt];
}

final class AlarmScheduleRequested extends AlarmEvent {
  final Alarm alarm;

  const AlarmScheduleRequested({required this.alarm});

  @override
  List<Object?> get props => [alarm];
}

final class AlarmCancelRequested extends AlarmEvent {
  final int alarmId;

  const AlarmCancelRequested({required this.alarmId});

  @override
  List<Object?> get props => [alarmId];
}
