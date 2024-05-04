import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tugas_kelompok_semester4/project/home.dart';
import 'package:tugas_kelompok_semester4/project/history.dart';
import 'package:tugas_kelompok_semester4/project/profile.dart';
import 'package:tugas_kelompok_semester4/project/walletPage.dart';
import 'package:tugas_kelompok_semester4/project/detail.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    WalletPage(),
    HistoryPembelian(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.blueAccent,
        color: Colors.deepOrange.shade300,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.home),
          Icon(Icons.account_balance_wallet_rounded),
          Icon(Icons.history),
          CircleAvatar(
                backgroundImage: NetworkImage(
                  "${currentUser.foto}",
                ),
                radius: 15,
              ),
        ],
        onTap:_onItemTapped,
        index: _selectedIndex,
      ),
    );
  }   
}
