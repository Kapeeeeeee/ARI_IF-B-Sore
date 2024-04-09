import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pembayaran'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(8),
            child: Column( // Menggunakan Column sebagai parent
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Image.network(
                        "https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/06/16/CHAT-GPT-1903337166.jpg",
                        width: 120,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "RM Enak Banget LOHH",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Text(
                                'Jl. M.H Thamrin No.140, Pusat Ps., Kec. Medan Kota, Kota Medan, Sumatera Utara 20212',
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow,),
                                Text("4.3(1547)"),
                                SizedBox(width: 10),
                                Text(
                                  "\$99.0",
                                  style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Field Baru",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Masukkan Kode Promo ",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  child: Text("test"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
