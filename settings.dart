// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:kerkom/detail.dart';
import 'package:kerkom/home.dart';
import 'package:kerkom/main.dart';
import 'package:kerkom/provider.dart';
import 'package:kerkom/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kerkom/providerbutton.dart';
import 'package:kerkom/formregis.dart';

class Settings extends StatefulWidget {
  
  const Settings({super.key});

  @override
  State<Settings> createState() => _ContohCheckBoxState();
}

class _ContohCheckBoxState extends State<Settings> {
  
  @override
  Widget build(BuildContext context) {
    // Menyediakan instance dari PrivacyProvider dan NotificationProvider
    var privacyProvider = Provider.of<PrivacyProvider>(context);
    var notificationProvider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              RadioListTile(
                value: 0,
                groupValue: privacyProvider.selected,
                onChanged: (val) {
                  privacyProvider.choice(val);
                },
                title: Text("Public"),
                subtitle: Text("Everyone Can see your Contact "),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color.fromARGB(255, 255, 64, 0),
              ),
              RadioListTile(
                value: 1,
                groupValue: privacyProvider.selected,
                onChanged: (val) {
                  privacyProvider.choice(val);
                },
                title: Text("Contact Only "),
                subtitle: Text("Only Contact can see your Profile"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              RadioListTile(
                value: 2,
                groupValue: privacyProvider.selected,
                onChanged: (val) {
                  privacyProvider.choice(val);
                },
                title: Text("Private "),
                subtitle: Text("Only certain people can see your posts"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 30),
              Text(
                "Notifications",
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
              SizedBox(height: 30),
              // SwitchListTile(
              //     title: Text("Night Mode"),
              //     value: Provider.of<ThemeModeProvider>(context).themeMode,
              //     onChanged: (val) {
              //       setState(() {
              //         Provider.of<ThemeModeProvider>(context, listen: false)
              //             .toggleTheme(val);
              //       });
              //     }),
              SizedBox(
                height: 30,
              ),
              Consumer<AccountProvider>(
          builder: (context, accountProvider, _) {
            List<Account> accounts = accountProvider.accounts;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Pilih Akun:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    Account account = accounts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                        "${account.foto}",
                        ),
                        radius: 15,),
                      title: Text(account.namauser),
                      trailing: IconButton(
                        onPressed: () {
                    setState(() {
                      _showConfirmationDialog(context,account);
                    });
                  },
                      
                      icon: Icon(Icons.close),),
                      onTap: () {
                        // Panggil method switchAccount dari AccountProvider
                        accountProvider.switchAccount(account);
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home()), (route) => false);
                      },
                    );
                  },
                ),
                ElevatedButton(
                onPressed: (){setState(() {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FormPage())
                );
                  });},
                child: Row(children: [
                  Icon(Icons.person_2,),
                  SizedBox(width: 10,),
                  Text("Tambahkan akun anda yang lain"),
                ],))
              ],
            );
          },
        ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Signup()), (route) => false);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Log Out"),
                    Icon(Icons.door_front_door)

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context,Account account) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Do you want to delete thia account?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // No
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: ()  {
                setState(() {
                  accounts.remove(account);
                });
                Navigator.of(context).pop(true); // Yes
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
