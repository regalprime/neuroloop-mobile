part of 'alarm_bloc.dart';

enum AlarmStatus {
  initial,
  selectingTime,
  scheduling,
  success,
  failure,
}

class AlarmState extends Equatable {
  final AlarmStatus status;
  final Alarm? alarm;
  final String? errorMessage;

  const AlarmState({this.status = AlarmStatus.initial, this.alarm, this.errorMessage});

  AlarmState copyWith({
    AlarmStatus? status,
    Alarm? alarm,
    String? errorMessage,
  }) {
    return AlarmState(
      status: status ?? this.status,
      alarm: alarm ?? this.alarm,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, alarm, errorMessage];
}
