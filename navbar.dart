import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'detail.dart';
import 'profile.dart';
import 'history.dart';
import 'home.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int current = 0;

  Widget bodyPage(int index) {
    if (index == 0) {
      return Home();
    } else if (index == 1) {
      return HistoryPembelian();
    } else {
      return Profile();
    }
  }

  @override
  Widget build(BuildContext context) {
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;
    return Scaffold(
      body: bodyPage(current),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(
                  "${currentUser.foto}",
                ),
                radius: 15,
              ),
              label: 'Profile'),
        ],
        selectedItemColor: Colors.red,
        currentIndex: current,
        onTap: (int index) {
          setState(() {
            current = index;
          });
        },
      ),
    );
  }
}
