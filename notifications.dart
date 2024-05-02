// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providerbutton.dart'; // Pastikan Anda mengimpor file yang berisi PrivacyProvider dan NotificationProvider

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    // Menyediakan instance dari PrivacyProvider dan NotificationProvider
    var notificationProvider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Notifications on App",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                value: 0,
                groupValue: notificationProvider.selected,
                onChanged: (val) {
                  notificationProvider.choice(val);
                },
                title: Text("All"),
                subtitle: Text("Receive all notifications"),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color.fromARGB(255, 255, 60, 0),
              ),
              RadioListTile(
                value: 1,
                groupValue: notificationProvider.selected,
                onChanged: (val) {
                  notificationProvider.choice(val);
                },
                title: Text("Important"),
                subtitle: Text(
                    "Get notified only for important interactions,such as direct message and mentions"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              RadioListTile(
                value: 2,
                groupValue: notificationProvider.selected,
                onChanged: (val) {
                  notificationProvider.choice(val);
                },
                title: Text("None"),
                subtitle: Text(
                    "You wont be disturbed by any notifications from the app"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
