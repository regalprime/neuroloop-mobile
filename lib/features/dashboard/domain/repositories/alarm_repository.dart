import 'package:neuroloop/features/dashboard/domain/entities/alarm.dart';

abstract interface class AlarmRepository {
  Future<void> schedule({required Alarm alarm});

  Future<void> cancel({required int alarmId});

  Future<void> openExactAlarmSettings();

  Future<void> requestNotificationPermission();
}
