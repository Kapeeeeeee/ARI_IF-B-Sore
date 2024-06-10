// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kerkom/alamat.dart';
import 'package:kerkom/detail.dart';
import 'package:kerkom/diskon.dart';
import 'package:kerkom/metode_pembayaran.dart';
import 'package:kerkom/payment_cont.dart';
import 'package:kerkom/provider.dart';
import 'package:provider/provider.dart';
import 'package:kerkom/rating.dart';

class Pembayaran extends StatefulWidget {
  final List<CartItem> selectedItems;

  Pembayaran({required this.selectedItems});
  @override
  State<Pembayaran> createState() => _BayarState();
}

class _BayarState extends State<Pembayaran> {
  // bool isPriority = false;
  int totalCost =0;

  double total(List<CartItem> items) {
    double total = 0;
    for (var item in items) {
      total += item.harga * item.itemCount;
    }
    return total;
  }

  int banyak(List<CartItem> items) {
    int banyak = 0;
    for (var item in items) {
      banyak += item.itemCount;
    }
    return banyak;
  }

  @override
  Widget build(BuildContext context) {
    final alamatProvider = Provider.of<AccountProvider>(context);
    if (alamatProvider.alamatSelected == null) {
      alamatProvider.setAlamat(
          alamatProvider.alamatList[0], 0); // Tetapkan alamat default
    }

    final Alamat? alamat = alamatProvider.alamatSelected;
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;
    final List<CartItem> items = currentUser.cart;
    final diskon = Provider.of<PromoProvider>(context).promoPercentage;
    final isPriority = Provider.of<PriorityProvider>(context).isPriority;

    double subtotal = total(widget.selectedItems); // Total dari pesanan
    double jumlahDiskon = subtotal * ((diskon ?? 0) / 100);
    Map<String, int> jumlahItemPerToko = {};

    for (var item in items) {
      jumlahItemPerToko[item.namatoko] =
          (jumlahItemPerToko[item.namatoko] ?? 0) + item.itemCount;
    }

    double totalOngkir() {
      double ongkir = alamat?.ongkir ?? 0;
      double priority = isPriority ? 2000 : 0;
      double total = ongkir + priority;

      return total;
    }

    double totalPesanan() {
      double biayaAdministrasi = 2000; // Biaya administrasi tetap

      return subtotal +
          totalOngkir() +
          biayaAdministrasi -
          jumlahDiskon; // Hitung total
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Pembayaran"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AlamatPage()), //perlu diubah ke halaman alamat pengiriman
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(
                          "Alamat Pengiriman",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 23),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${alamat?.nama ?? ""} | ${alamat?.nohp}",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text("${alamat?.detail}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(fontSize: 15)),
                              ),
                              Icon(Icons.arrow_forward_ios_sharp),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.fire_truck_outlined,
                    color: Colors.lightBlueAccent,
                  ),
                  Text(
                    "Opsi Pengiriman",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Provider.of<PriorityProvider>(context,
                                    listen: false)
                                .setPriority(true);
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: isPriority
                                ? Colors.orangeAccent
                                : Colors.black,
                                width: 2),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Prioritas < 23 Menit",
                                style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold
                                ),),
                                Text("Tambah Rp. 2000 agar pesananmu datang lebih cepat",
                                  style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300
                                  ),)
                              ],
                            ),
                           
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Provider.of<PriorityProvider>(context,
                                    listen: false)
                                .setPriority(false);
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: isPriority
                                    ? Colors.black
                                    : Colors.orangeAccent,
                                width: 2),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 25),
                              child: Text(
                                "Standar - 28 Menit",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.blueGrey,
                thickness: 4,
                height: 30,
              ),
              for (int i = 0; i < widget.selectedItems.length; i++)
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.storefront_outlined),
                            Text("${widget.selectedItems[i].namatoko}")
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        // Expanded(
                        //   flex: 3,
                        //   child: Text(
                        //     widget.selectedItems[i].itemName,
                        //     overflow: TextOverflow.ellipsis, // Memotong teks yang terlalu panjang
                        //     maxLines: 1, // Memastikan hanya satu baris yang ditampilkan
                        //   ),
                        // ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                widget.selectedItems[i].itemName,
                                overflow: TextOverflow
                                    .ellipsis, // Memotong teks yang terlalu panjang
                                maxLines:
                                    1, // Memastikan hanya satu baris yang ditampilkan
                              ),
                            ),
                            Spacer(),
                            Text(
                              NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(widget.selectedItems[i].harga),
                            ),
                            Spacer(),
                            Text("${widget.selectedItems[i].itemCount}"),
                            Spacer(),
                            Text(
                              NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp. ',
                                decimalDigits: 0,
                              ).format(widget.selectedItems[i].harga *
                                  widget.selectedItems[i].itemCount),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Pesanan : ",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    // Text("Rp ${total(widget.selectedItems).toStringAsFixed(0)}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.orange),),
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp. ',
                        decimalDigits: 0,
                      ).format(total(widget.selectedItems)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black38), // Atas
                  bottom: BorderSide(width: 1.0, color: Colors.black38),
                )),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.black12,
                thickness: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Promo()), //perlu diubah ke halaman alamat diskon
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.discount_rounded,
                        color: Colors.orange,
                      ),
                      Text("Kode Promo : "),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 6,
                      ),
                      Text(
                        "Gunakan/ masukkan kode",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Icon(Icons.keyboard_arrow_right_rounded)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Divider(
                color: Colors.black12,
                thickness: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Metode()), //perlu diubah ke halaman alamat metode
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.orange,
                      ),
                      Text("Metode Pembayaran : "),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                      ),
                      Text("Master Card"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 16,
                      ),
                      Icon(Icons.keyboard_arrow_right_rounded)
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal Pemesanan (${banyak(widget.selectedItems).toString()} menu)",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp. ',
                      decimalDigits: 0,
                    ).format(total(widget.selectedItems)),
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                  // Text("Rp ${total(widget.selectedItems).toStringAsFixed(0)}", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13,),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Voucher Diskon",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp. ',
                      decimalDigits: 0,
                    ).format(jumlahDiskon),
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                  // Text("- Rp ${jumlahDiskon.toStringAsFixed(0)}", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13,),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Biaya Pengiriman",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp. ',
                      decimalDigits: 0,
                    ).format(totalOngkir()),
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                  // Text("Rp ${totalOngkir().toStringAsFixed(0)}", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13,),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Biaya Administrasi",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                  Text(
                    "Rp 2.000",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp. ',
                      decimalDigits: 0,
                    ).format(totalPesanan()),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  // Text("Rp ${totalPesanan().toStringAsFixed(0)}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,color: Colors.orange),),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.black12,
                thickness: 20,
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Text(
              "Total Pembayaran",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            Text(
              NumberFormat.currency(
                locale: 'id_ID',
                symbol: 'Rp. ',
                decimalDigits: 0,
              ).format(totalPesanan()),
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ],
        ),
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.orangeAccent, // Warna border
            ),
            color: Colors.orangeAccent, // Warna latar belakang
          ),
          child: TextButton(
              onPressed: () {
                setState(() {
                  int duit = currentUser.uang;
                  int kurang = totalPesanan().toInt();
                  duit -= kurang;
                  currentUser.uang = duit;
                  for (int i = 0; i < widget.selectedItems.length; i++){
                  currentUser.cart.remove(widget.selectedItems[i]);}
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Invoice(
                    selectedItems: widget.selectedItems,
                    totalCost : kurang
                  )));
                });
              },
              child: Text(
                "Konfirmasi Pembayaran",
                style: TextStyle(color: Colors.white),
              )),
        ),
        
      ],
    );
  }
}
