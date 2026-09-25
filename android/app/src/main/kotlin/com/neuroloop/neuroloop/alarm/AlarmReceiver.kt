package com.neuroloop.neuroloop.alarm

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class AlarmReceiver : BroadcastReceiver() {

    override fun onReceive(
        context: Context,
        intent: Intent
    ) {
        val alarmId =
            intent.getIntExtra(
                "alarm_id",
                -1
            )

        val title =
            intent.getStringExtra("title")
                ?: "NeuroLoop"

        val body =
            intent.getStringExtra("body")
                ?: "Time to focus"

        AlarmNotificationManager.show(
            context = context,
            id = alarmId,
            title = title,
            body = body
        )
    }
}