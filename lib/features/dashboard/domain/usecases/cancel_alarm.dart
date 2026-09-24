import 'package:neuroloop/features/dashboard/domain/repositories/alarm_repository.dart';

class CancelAlarmUsecase {
  final AlarmRepository repository;

  const CancelAlarmUsecase({required this.repository});

  Future<void> call({required int alarmId}) {
    return repository.cancel(id: alarmId);
  }
}
