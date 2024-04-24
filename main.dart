import 'package:flutter/material.dart';
import 'package:kerkom/alamat.dart';
import 'package:kerkom/cart.dart';
import 'package:kerkom/diskon.dart';
import 'package:kerkom/home.dart';
import 'package:kerkom/payment_cont.dart';
import 'package:kerkom/pembayaran_lanjutan.dart';
import 'package:kerkom/metode_pembayaran.dart';
import 'package:kerkom/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CartProvider()),
      ChangeNotifierProvider(create: (context) => AlamatProvider()),
      ChangeNotifierProvider(create: (context) => PromoProvider()),
      ChangeNotifierProvider(create: (context) => PriorityProvider()),

    ],
      child: MaterialApp(
        title: "Coba",
        debugShowCheckedModeBanner: false,
        home: Invoice(),
      ),
    );
  }
}
