import 'package:flutter/services.dart';

class AlarmPlatformService {
  static const MethodChannel _methodChannel = MethodChannel('com.neuroloop.neuroloop');

  static Future<void> scheduleAlarm({
    required String alarmId,
    required DateTime scheduleAt,
    required String title,
    required String body,
  }) async {
    await _methodChannel.invokeMethod(
      'scheduleAlarm',
      {
        'alarmId': alarmId,
        'scheduleAt': scheduleAt.millisecondsSinceEpoch,
        'title': title,
        'body': body,
      },
    );
  }

  static Future<void> cancelAlarm({required String alarmId}) async {
    await _methodChannel.invokeMethod('cancelAlarm', {'alarmId': alarmId});
  }
}
