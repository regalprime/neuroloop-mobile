import 'package:flutter/services.dart';

class AlarmPlatformService {
  static const MethodChannel _channel =
  MethodChannel('com.neuroloop.neuroloop/alarm');

  static Future<String> scheduleAlarm({
    required int id,
    required DateTime scheduledAt,
    String title = 'NeuroLoop',
    String body = 'Time to focus',
  }) async {
    final result = await _channel.invokeMethod<String>(
      'scheduleAlarm',
      {
        'alarmId': id,
        'timestamp': scheduledAt.millisecondsSinceEpoch,
        'title': title,
        'body': body,
      },
    );

    return result ?? 'unknown';
  }

  static Future<void> cancelAlarm(int id,) async {
    await _channel.invokeMethod(
      'cancelAlarm',
      {
        'alarmId': id,
      },
    );
  }

  static Future<void> openExactAlarmSettings() async {
    await _channel.invokeMethod(
      'openExactAlarmSettings',
    );
  }

  static Future<void> requestNotificationPermission() async {
    await _channel.invokeMethod(
      'requestNotificationPermission',
    );
  }
}