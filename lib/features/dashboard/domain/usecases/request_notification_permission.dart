import 'package:neuroloop/features/dashboard/domain/repositories/alarm_repository.dart';

class RequestNotificationPermissionUseCase {
  final AlarmRepository _repository;

  const RequestNotificationPermissionUseCase({required AlarmRepository repository}) : _repository = repository;

  Future<void> call() {
    return _repository.requestNotificationPermission();
  }
}
