import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:m01/detail.dart';
import 'package:m01/provider.dart';
import 'package:provider/provider.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat("dd  MMMM  yyyy, HH:mm 'WIB'").format(now);


class Invoice extends StatefulWidget {

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  bool _isChecked = false;

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

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
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
                    key: ValueKey<bool>(_isChecked), // Kunci unik untuk AnimatedSwitcher
                    size: 100,
                  ),
                ),
              )
            ),
            Center(
              child: Container(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Text("Berhasil", style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen
                    ),),
                    SizedBox(height: 10,),
                    Text("$formattedDate", style: TextStyle(
                        fontSize: 15
                    ),),
                    SizedBox(height: 3,),
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp. ',
                        decimalDigits: 0,
                      ).format(65000),style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 25
                    ),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Container(
                  child:
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tipe Transaksi",style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w300
                        ),),
                        Text("Wallet", style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600
                        ),),
                        SizedBox(height: 5,),
                        Divider(
                          color: Colors.black12,
                          thickness: 2,
                        ),Text("Nama Pengguna",style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w300
                        ),),
                        Text("Kenzie Pragata", style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600
                        ),),
                        SizedBox(height: 5,),
                        Divider(
                          color: Colors.black12,
                          thickness: 2,
                        ),Text("No HP",style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w300
                        ),),
                        Text("+6282272472562", style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600
                        ),),
                        SizedBox(height: 5,),
                        Divider(
                          color: Colors.black12,
                          thickness: 2,
                        ),
                        SizedBox(height: 100,)
                      ],
                    ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter, // Menempatkan konten di bagian paling bawah
              child: SizedBox(
                width: double.infinity/4,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF419197)
                  ),
                  onPressed: () {
                    // Aksi untuk tombol
                  },
                  child: Text("Kembali ke Home Page", style: TextStyle(
                    fontSize: 15, color: Colors.white
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

