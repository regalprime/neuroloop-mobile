import 'package:neuroloop/core/platform/alarm_platform_service.dart';
import 'package:neuroloop/features/dashboard/domain/entities/alarm.dart';
import 'package:neuroloop/features/dashboard/domain/repositories/alarm_repository.dart';

class AlarmRepositoryImpl implements AlarmRepository {
  final AlarmPlatformService _alarmPlatformService;

  const AlarmRepositoryImpl({required AlarmPlatformService alarmPlatformService})
      : _alarmPlatformService = alarmPlatformService;

  @override
  Future<void> schedule({required Alarm alarm}) {
    // TODO: implement schedule
    throw UnimplementedError();
  }

  @override
  Future<void> cancel({required int alarmId}) {
    return _alarmPlatformService.cancelAlarm(alarmId: alarmId);
  }

  @override
  Future<void> openExactAlarmSettings() {
    return _alarmPlatformService.openExactAlarmSettings();
  }

  @override
  Future<void> requestNotificationPermission() {
    return _alarmPlatformService.requestNotificationPermission();
  }
}

class AlarmScheduleException implements Exception {
  final String message;

  const AlarmScheduleException(this.message);

  @override
  String toString() => message.toString();
}

class ExactAlarmPermissionException implements Exception {
  const ExactAlarmPermissionException();
}