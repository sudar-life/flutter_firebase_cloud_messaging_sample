import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_sample/src/app.dart';
import 'package:flutter_chat_sample/src/controller/notification_controller.dart';
import 'package:flutter_chat_sample/src/page/message_page.dart';
import 'package:get/get.dart';

import 'src/controller/notification_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: BindingsBuilder(
        () {
          Get.put(NotificationController());
        },
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Obx(() {
            if (NotificationController.to.message.isNotEmpty) {
              showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                        title: Text("dialog"),
                        content:
                            Text(NotificationController.to.message.keys.first),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Close me!'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ));
            }
            return Container(); //
          }),
        ),
      ),
    );
  }
}
