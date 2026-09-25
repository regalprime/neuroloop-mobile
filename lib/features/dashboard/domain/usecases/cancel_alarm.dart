import 'package:neuroloop/features/dashboard/domain/repositories/alarm_repository.dart';

class CancelAlarmUseCase {
  final AlarmRepository _repository;

  const CancelAlarmUseCase({required AlarmRepository repository}) : _repository = repository;

  Future<void> call({required int alarmId}) {
    return _repository.cancel(id: alarmId);
  }
}
