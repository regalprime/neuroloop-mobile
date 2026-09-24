import 'package:neuroloop/features/dashboard/domain/entities/alarm.dart';
import 'package:neuroloop/features/dashboard/domain/repositories/alarm_repository.dart';

class ScheduleAlarmUseCase {
  final AlarmRepository repository;

  const ScheduleAlarmUseCase({required this.repository});

  Future<void> call(Alarm alarm) {
    return repository.schedule(alarm: alarm);
  }
}
