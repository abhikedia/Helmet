package shatter.kedia.helmetv01

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import android.telephony.SmsManager
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

  private val callResult: MethodChannel.Result? = null

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      if (call.method == "send") {
        val num = call.argument<String>("phone")
        val msg = call.argument<String>("msg")
        sendSMS(num, msg, result)
      } else {
        result.notImplemented()
      }
    }
  }

  private fun sendSMS(phoneNo: String?, msg: String?, result: MethodChannel.Result) {
    try {
      val smsManager = SmsManager.getDefault()
      smsManager.sendTextMessage(phoneNo, null, msg, null, null)
      result.success("SMS Sent")
    } catch (ex: Exception) {
      ex.printStackTrace()
      result.error("Err", "Sms Not Sent", "")
    }

  }

  companion object {
    private val CHANNEL = "sendSms"
  }

}