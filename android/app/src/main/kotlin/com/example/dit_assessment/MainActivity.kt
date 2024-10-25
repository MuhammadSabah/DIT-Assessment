package com.example.dit_assessment

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES

class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryInfo") {
                val batteryInfo = getBatteryInfo()
                if (batteryInfo != null) {
                    result.success(batteryInfo)
                } else {
                    result.error("UNAVAILABLE", "Battery information not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getBatteryInfo(): Map<String, Any> {
        val batteryInfo = mutableMapOf<String, Any>()

        val batteryIntent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))

        if (batteryIntent == null) {
            batteryInfo["batteryLevel"] = "Unknown"
            batteryInfo["status"] = "Unknown Status"
        } else {
            batteryInfo["batteryLevel"] = getBatteryLevel(batteryIntent)
            batteryInfo["status"] = getBatteryStatus(batteryIntent)
        }

        return batteryInfo
    }

    private fun getBatteryLevel(intent: Intent): Int {
        return if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
            val scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
            (level * 100) / scale
        }
    }

    private fun getBatteryStatus(intent: Intent): String {
        val status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
        return when (status) {
            BatteryManager.BATTERY_STATUS_CHARGING -> "Charging"
            BatteryManager.BATTERY_STATUS_DISCHARGING -> "Discharging"
            BatteryManager.BATTERY_STATUS_FULL -> "Full"
            BatteryManager.BATTERY_STATUS_NOT_CHARGING -> "Not charging"
            BatteryManager.BATTERY_STATUS_UNKNOWN -> "Unknown"
            else -> "Unknown"
        }
    }
}
