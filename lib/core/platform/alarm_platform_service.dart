import 'package:flutter/services.dart';

class AlarmPlatformService {
  final MethodChannel _channel;

  AlarmPlatformService({MethodChannel? channel})
      : _channel = channel ?? const MethodChannel('com.neuroloop.neuroloop/alarm');

  Future<String> scheduleAlarm({
    required int alarmId,
    required DateTime scheduledAt,
    required String title,
    required String body,
  }) async {
    final result = await _channel.invokeMethod<String>(
      'scheduleAlarm',
      {
        'alarmId': alarmId,
        'timestamp': scheduledAt.millisecondsSinceEpoch,
        'title': title,
        'body': body,
      },
    );

    return result ?? 'unknown';
  }

  Future<void> cancelAlarm({required int alarmId}) async {
    await _channel.invokeMethod(
      'cancelAlarm',
      {
        'alarmId': alarmId,
      },
    );
  }

  Future<void> openExactAlarmSettings() async {
    await _channel.invokeMethod(
      'openExactAlarmSettings',
    );
  }

  Future<void> requestNotificationPermission() async {
    await _channel.invokeMethod(
      'requestNotificationPermission',
    );
  }
}
