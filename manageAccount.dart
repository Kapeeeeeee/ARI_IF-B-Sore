// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kerkom/formregis.dart';
import 'package:kerkom/main.dart';
import 'package:kerkom/navbar.dart';
import 'package:provider/provider.dart';
import 'package:kerkom/detail.dart';
import 'package:kerkom/home.dart';
import 'package:kerkom/provider.dart';
import 'package:kerkom/signup.dart';

class ManageAcc extends StatefulWidget {
  const ManageAcc({super.key});

  @override
  State<ManageAcc> createState() => _ManageAccState();
}

class _ManageAccState extends State<ManageAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Center"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              ),
              SizedBox(
                height: 30,
              ),
             
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

