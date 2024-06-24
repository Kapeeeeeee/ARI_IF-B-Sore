import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kerkom/history.dart';
import 'package:kerkom/home.dart';
import 'package:kerkom/profile.dart';
import 'package:kerkom/detail.dart';
import 'package:kerkom/provider.dart';
import 'package:kerkom/wallet.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Wallet(),
    PurchaseHistoryPage(),
    Profile(),

  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;
    final theme = Theme.of(context);

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? Color.fromARGB(255, 28, 109, 156)
                  : Color.fromARGB(255, 28, 109, 156),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1),
                topRight: Radius.circular(1),
              ),
            ),
            child: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: theme.brightness == Brightness.dark
                  ? Color.fromARGB(223, 0, 0, 0)
                  : Color.fromARGB(223, 241, 241, 241),
              color: theme.brightness == Brightness.dark
                  ? const Color.fromARGB(255, 31, 31, 31)
                  : Color.fromARGB(255, 218, 218, 218),
              animationDuration: Duration(milliseconds: 300),
              height: 50,
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
              onTap: _onItemTapped,
              index: _selectedIndex,
            ),
          ),
        ],
      ),
    );
  }
}