import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:kerkom/project/detail.dart';
import 'package:kerkom/project//provider.dart';
import 'package:kerkom/project/rating.dart';
import 'package:provider/provider.dart';

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
    Account currentUser = Provider.of<AccountProvider>(context, listen: false).currentAccount;
    int totalCost = widget.totalCost;

    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
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
                    SizedBox(height: 9,),
                    Text("Berhasil", style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen
                    ),),
                    SizedBox(height: 6,),
                    Text("$formattedDate", style: TextStyle(
                        fontSize: 15
                    ),),
                    SizedBox(height: 3,),
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp. ',
                        decimalDigits: 0,
                      ).format(totalCost),style: TextStyle(
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
                      Text("${currentUser.namauser}", style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: 5,),
                      Divider(
                        color: Colors.black12,
                        thickness: 2,
                      ),Text("No HP",style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w300
                      ),),
                      Text("${currentUser.nohp}", style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: 5,),
                      Divider(
                        color: Colors.black12,
                        thickness: 2,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/4,)
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter, // Menempatkan konten di bagian paling bawah
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF419197)
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Rating(
                        selectedItems: widget.selectedItems,
                    )));
                  },
                  child: Text("Beri Penilaian", style: TextStyle(
                      fontSize: 15, color: Colors.white
                  ),),
                ),
              ),
            ),
          ],
        ),
    );

  }
}

