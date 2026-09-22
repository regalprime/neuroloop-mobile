package com.neuroloop.neuroloop

import android.content.Intent
import android.os.Build
import android.provider.Settings
import com.neuroloop.neuroloop.alarm.AlarmManagerHelper
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {

    private val channelName = "com.neuroloop.neuroloop/alarm"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName
        ).setMethodCallHandler { call, result ->

            when (call.method) {

                "scheduleAlarm" -> {
                    val id = call.argument<Int>("alarmId")
                    val timestamp = call.argument<Long>("timestamp")
                    val title = call.argument<String>("title")
                    val body = call.argument<String>("body")

                    if (
                        id == null ||
                        timestamp == null ||
                        title == null ||
                        body == null
                    ) {
                        result.error(
                            "INVALID_ARGUMENT",
                            "Invalid alarm arguments",
                            null
                        )
                        return@setMethodCallHandler
                    }

                    AlarmManagerHelper.schedule(
                        context = this,
                        id = id,
                        timestamp = timestamp,
                        title = title,
                        body = body
                    )

                    result.success(null)
                }

                "cancelAlarm" -> {
                    val id = call.argument<Int>("alarmId")

                    if (id == null) {
                        result.error(
                            "INVALID_ARGUMENT",
                            "Alarm id is required",
                            null
                        )
                        return@setMethodCallHandler
                    }

                    AlarmManagerHelper.cancel(
                        context = this,
                        id = id
                    )

                    result.success(null)
                }

                "openExactAlarmSettings" -> {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                        val intent = Intent(
                            Settings.ACTION_REQUEST_SCHEDULE_EXACT_ALARM
                        )

                        startActivity(intent)
                    }

                    result.success(null)
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}