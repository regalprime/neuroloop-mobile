import 'package:neuroloop/features/dashboard/domain/entities/alarm.dart';
import 'package:neuroloop/features/dashboard/domain/repositories/alarm_repository.dart';

class AlarmRepositoryImpl implements AlarmRepository {
  @override
  Future<void> schedule({required Alarm alarm}) {
    // TODO: implement schedule
    throw UnimplementedError();
  }

  @override
  Future<void> cancel({required int id}) {
    // TODO: implement cancel
    throw UnimplementedError();
  }

  @override
  Future<void> openExactAlarmSettings() {
    // TODO: implement openExactAlarmSettings
    throw UnimplementedError();
  }

  @override
  Future<void> requestNotificationPermission() {
    // TODO: implement requestNotificationPermission
    throw UnimplementedError();
  }
}