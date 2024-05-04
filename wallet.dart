import 'package:kerkom/project/detail.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  State<Wallet> createState() => _WalletPageState();
}

class _WalletPageState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Wallet Balance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Rp.${p1.uang}', // Ganti dengan variabel atau data yang sesuai
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Sesuaikan dengan warna yang diinginkan
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika yang diperlukan ketika tombol "Top Up" ditekan
              },
              child: Text('Top Up'), // Ganti teks sesuai kebutuhan
            ),
          ],
        ),
      ),
    );
  }
}

