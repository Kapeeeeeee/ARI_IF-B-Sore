// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:kerkom/detail.dart';
import 'package:kerkom/history.dart';
import 'package:kerkom/provider.dart';
import 'package:kerkom/rating.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat("dd  MMMM  yyyy, HH:mm 'WIB'").format(now);

class Invoice extends StatefulWidget {
  final List<CartItem>? selectedItems;
  final int totalCost;

  Invoice({this.selectedItems, required this.totalCost});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  bool _isChecked = false;
  List<PurchaseHistory> _purchaseHistory = [];

  @override
  void initState() {
    super.initState();

    // Mengubah ikon setelah 3 detik
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isChecked = true; // Ubah state untuk mengubah ikon
      });
    });
  }

  void _toggleIcon() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  void _savePurchaseHistory(String date, int totalCost) {
    setState(() {
      _purchaseHistory.add(PurchaseHistory(date: date, totalCost: totalCost));
    });
  }

  @override
  Widget build(BuildContext context) {
    Account currentUser =
        Provider.of<AccountProvider>(context, listen: false).currentAccount;
    int totalCost = widget.totalCost;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: GestureDetector(
                onTap: _toggleIcon, // Mengganti ikon saat di-klik
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1), // Durasi transisi
                  transitionBuilder: (widget, animation) {
                    return FadeTransition(
                      opacity: animation, // Transisi dengan fade
                      child: widget,
                    );
                  },
                  child: Icon(
                    _isChecked
                        ? Icons.check_circle_outline_rounded
                        : Icons.access_time_rounded,
                    color: Colors.blueGrey,
                    key: ValueKey<bool>(
                        _isChecked), // Kunci unik untuk AnimatedSwitcher
                    size: 100,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 9),
                    Text(
                      "Berhasil",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "$formattedDate",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp. ',
                        decimalDigits: 0,
                      ).format(totalCost),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tipe Transaksi",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "Wallet",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Colors.black12,
                        thickness: 2,
                      ),
                      Text(
                        "Nama Pengguna",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "${currentUser.namauser}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Colors.black12,
                        thickness: 2,
                      ),
                      Text(
                        "No HP",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "${currentUser.nohp}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Colors.black12,
                        thickness: 2,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
                    ],
                  ),
                ),
              ),
            ),
            Align(
             alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF419197),
                  ),
                  onPressed: () {
                    _addPurchaseToHistory(currentUser, formattedDate, totalCost, widget.selectedItems);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Rating(
                          selectedItems: widget.selectedItems,
                        ),
                      ),(route) => false
                    );
                  },
                  child: Text(
                    "Beri Penilaian",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
void _addPurchaseToHistory(Account currentUser, String date, int totalCost, List<CartItem>? selectedItems) {
  currentUser.history.add(PurchaseHistory(date: date, totalCost: totalCost, selectedItems: selectedItems));
}
}