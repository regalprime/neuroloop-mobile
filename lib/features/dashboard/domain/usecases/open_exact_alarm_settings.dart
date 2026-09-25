import 'package:neuroloop/features/dashboard/domain/repositories/alarm_repository.dart';

class OpenExactAlarmSettingsUseCase {
  final AlarmRepository _repository;

  const OpenExactAlarmSettingsUseCase({required AlarmRepository repository}) : _repository = repository;

  Future<void> call() {
    return _repository.openExactAlarmSettings();
  }
}
