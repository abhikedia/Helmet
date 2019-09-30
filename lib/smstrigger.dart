import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';


class SendSms extends StatefulWidget {
  @override
  _SendSmsState createState() => _SendSmsState();
}

class _SendSmsState extends State<SendSms> {
//  _sendSMS(String message, List<String> recipents) async {
//    String _result =
//        await FlutterSms.sendSMS(message: message, recipients: recipents)
//            .catchError((onError) {
//      print(onError);
//    });
//    print(_result);
//    return(_result);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    String message = "This is a test message!";
//    List<String> recipents = ["7985828279"];
//    return new Scaffold(
//        appBar: new AppBar(
//          backgroundColor: Colors.green,
//          title: Text("Text"),
//
//        ),
//      body: new Padding(
//        padding: const EdgeInsets.only(
//            left: 20.0, right: 5.0, top: 10.0),
//        child: new RaisedButton(
//          padding: const EdgeInsets.all(8.0),
//          textColor: Colors.white,
//          color: Color(0xFF18D191),
//          onPressed:_sendSMS(message,recipents),
//          child: new Text("Login"),
//        ),
//      ),
//    );
//  }

  static const platform = const MethodChannel('sendSms');

  Future<Null> sendSms() async {
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.sms]);
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.sms);
    ServiceStatus serviceStatus = await PermissionHandler().checkServiceStatus(PermissionGroup.sms);

    print("SendSMS");
    try {
      final String result = await platform.invokeMethod(
          'send', <String, dynamic>{
        "phone": "+919452634947",
        "msg": "Hello! I'm sent programatically."
      }); //Replace a 'X' with 10 digit phone number
      print(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        alignment: Alignment.center,
        child: new FlatButton(
            onPressed: () => sendSms(), child: const Text("Send SMS")),
      ),
    );
  }
}
