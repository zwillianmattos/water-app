package com.example.mobile_app

import io.flutter.embedding.android.FlutterActivity
import android.view.MotionEvent
import android.content.pm.PackageManager
import com.samsung.wearable_rotary.WearableRotaryPlugin

class MainActivity: FlutterActivity() {
    override fun onGenericMotionEvent(event: MotionEvent?): Boolean {
        return if (isSamsungWatch() && isSamsungRotaryPluginAvailable()) {
            when {
                WearableRotaryPlugin.onGenericMotionEvent(event) -> true
                else -> super.onGenericMotionEvent(event)
            }
        } else {
            super.onGenericMotionEvent(event)
        }
    }

    private fun isSamsungWatch(): Boolean {
        val pm = packageManager
        return pm.hasSystemFeature(PackageManager.FEATURE_WATCH)
    }

    private fun isSamsungRotaryPluginAvailable(): Boolean {
        return try {
            Class.forName("com.samsung.wearable_rotary.WearableRotaryPlugin")
            true
        } catch (e: ClassNotFoundException) {
            false
        }
    }
}