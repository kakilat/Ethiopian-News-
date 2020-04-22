import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ethionews/messaging/fbmessagemodel.dart';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
final List<FbMessage> messages=[];

  final FirebaseMessaging _firebaseMessaging= FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String,dynamic>message)async{
        print('onMessage');
        final notification=message['notification'];
        setState(() {
          messages.add(FbMessage(title: notification['title'],body: notification['body']));
        });
      },
      onLaunch: (Map<String,dynamic>message) async{
        print('On Launch');
        final notification=message['notification'];
        setState(() {
          messages.add(FbMessage(title: notification['title'],body: notification['body']));
        });
      },
        onResume: (Map<String,dynamic>message) async{
      print('On Resume');
      final notification=message['notification'];
      setState(() {
        messages.add(FbMessage(title: notification['title'],body: notification['body']));
      });
    }
    );
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true,badge: true,alert: true,provisional: false)

    );
  }

@override
Widget build(BuildContext context) {
    //MyWidgets.showGreenToast(messages[0].body.toString());
  return Container();

}


}
