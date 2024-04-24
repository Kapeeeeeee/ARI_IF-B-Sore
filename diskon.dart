import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:kerkom/provider.dart';

class Promo extends StatefulWidget {
  @override
  _PromoState createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  String kodePromo = "";
  @override
  Widget build(BuildContext context) {
    final promo = Provider.of<PromoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Masukkan Kode Promo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    return TextEditingValue(
                      text: newValue.text.toUpperCase(), // Ubah menjadi uppercase
                      selection: newValue.selection,
                    );
                  }),
                ],
                decoration: InputDecoration(
                  labelText: 'Masukkan Kode Promo',
                ),
                onChanged: (value) {
                  kodePromo = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                promo.setPromo(kodePromo);
              }, child: Text("Gunakan Kode Promo")),
              SizedBox(height: 30,),

              if (kodePromo != "")
                if (promo.promoPercentage != null)
                  Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.green[200], // Warna latar belakang Containerx
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Selamat! Anda mendapatkan diskon ${promo.promoPercentage}%',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        // Tambahan konten lain jika diperlukan
                      ],
                    ),
                  ),
                if (promo.promoPercentage == null)
                  Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.yellowAccent, // Warna latar belakang Container
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Maaf kode anda tidak valid',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        // Tambahan konten lain jika diperlukan
                      ],
                    ),
                  ),
              // Text(
              //   promo.promoPercentage != null
              //       ? 'Diskon: ${promo.promoPercentage}%'
              //       : 'Tidak ada promo',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
