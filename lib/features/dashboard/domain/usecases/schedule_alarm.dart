import 'package:neuroloop/features/dashboard/domain/entities/alarm.dart';
import 'package:neuroloop/features/dashboard/domain/repositories/alarm_repository.dart';

class ScheduleAlarmUseCase {
  final AlarmRepository _repository;

  const ScheduleAlarmUseCase({required AlarmRepository repository}) : _repository = repository;

  Future<void> call(Alarm alarm) {
    return _repository.schedule(alarm: alarm);
  }
}
