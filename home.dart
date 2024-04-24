// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:intl/intl.dart';
import 'package:kerkom/autoscroll.dart';
import 'package:kerkom/cart.dart';
import 'package:kerkom/profile.dart';
import 'package:kerkom/search.dart';
import 'package:flutter/material.dart';
import 'package:kerkom/detail.dart';

import 'package:kerkom/tampilan_produk.dart';
import 'package:flutter/widgets.dart';

final List<String> ls = [
  m1.fileName,
  m2.fileName,
  m3.fileName,
  m4.fileName,
  m5.fileName,
  m6.fileName,
  m7.fileName,
  m8.fileName,
  m9.fileName,
  m10.fileName
];
final List<String> txt = [
  m1.judul,
  m2.judul,
  m3.judul,
  m4.judul,
  m5.judul,
  m6.judul,
  m7.judul,
  m8.judul,
  m9.judul,
  m10.judul
];
final List<String> harga = [
  m1.harga.toString(),
  m2.harga.toString(),
  m3.harga.toString(),
  m4.harga.toString(),
  m5.harga.toString(),
  m6.harga.toString(),
  m7.harga.toString(),
  m8.harga.toString(),
  m9.harga.toString(),
  m10.harga.toString()
];
final List itemCount= [
   m1.itemCount,
  m2.itemCount,
  m3.itemCount,
  m4.itemCount,
  m5.itemCount,
  m6.itemCount,
  m7.itemCount,
  m8.itemCount,
  m9.itemCount,
  m10.itemCount
];

final List ls1 = [ m1,
  m2,
  m3,
  m4,
  m5,
  m6,
  m7,
  m8,
  m9,
  m10];

final List<String> mn = [
  mn1.fileName,
  mn2.fileName,
  mn3.fileName,
  mn4.fileName,
  mn5.fileName,
  mn6.fileName,
  mn7.fileName,
  mn8.fileName,
  mn9.fileName,
  mn10.fileName
];
final List<String> jdl = [
  mn1.judul,
  mn2.judul,
  mn3.judul,
  mn4.judul,
  mn5.judul,
  mn6.judul,
  mn7.judul,
  mn8.judul,
  mn9.judul,
  mn10.judul
];
final List<String> hargamn = [
  mn1.harga.toString(),
  mn2.harga.toString(),
  mn3.harga.toString(),
  mn4.harga.toString(),
  mn5.harga.toString(),
  mn6.harga.toString(),
  mn7.harga.toString(),
  mn8.harga.toString(),
  mn9.harga.toString(),
  mn10.harga.toString()
];
final List itemCountmn= [
  mn1.itemCount,
  mn2.itemCount,
  mn3.itemCount,
  mn4.itemCount,
  mn5.itemCount,
  mn6.itemCount,
  mn7.itemCount,
  mn8.itemCount,
  mn9.itemCount,
  mn10.itemCount
];

final List lsmn = [ mn1,
  mn2,
  mn3,
  mn4,
  mn5,
  mn6,
  mn7,
  mn8,
  mn9,
  mn10];

class AppColors {
  static const Color color1 = Color(0xFF222831);
  static const Color color2 = Color(0xFF393E46);
  static const Color color3 = Color(0xFF00ADB5);
  static const Color color4 = Color(0xFFEEEEEE);
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Hallo ${p1.namauser}"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Icon(Icons.search)),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Profile(p: p1),
              ));
            },
            icon: CircleAvatar(
              backgroundImage: NetworkImage("${p1.foto}"),
              radius: 25, // Sesuaikan dengan kebutuhan Anda
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      width: 80,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.color1,
                        borderRadius: BorderRadius.circular(
                            10), // Atur radius sesuai keinginan Anda
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Wallet",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'id_ID',
                              symbol: '',
                              decimalDigits: 0,
                            ).format(p1.uang),
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
            Text("${p1.namauser}"),
            Text("Hallo ${p1.namauser} Apa yang kamu mau pesan hari ini"),
            SizedBox(height: 30),
            Container(
              width: double.infinity, // Atur lebar sesuai kebutuhan Anda
              height: 300, // Atur tinggi sesuai kebutuhan Anda
              child: SlideScreen(
                imagePaths: banner,
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Makanan"),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: ls.length,
                    itemBuilder: (context, int i) {
                      
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Makanan(g: ls1[i], itemCount: itemCount[i]);
                          }));
                        },
                        child: Hero(
                          tag: ls[i], // Gunakan tag yang unik untuk setiap Hero
                          child: GridTile(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                '${ls[i]}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            footer: Container(
                              color: Color.fromARGB(255, 255, 255, 255),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 3),
                                child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          txt[i],
                                          overflow: TextOverflow.ellipsis, // Memotong teks yang terlalu panjang
                                          maxLines: 1, // Memastikan hanya satu baris yang ditampilkan
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 0, 0, 0),
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                  Spacer(),

                                  Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        symbol: '',
                                        decimalDigits: 0,
                                      ).format(int.parse(harga[i])),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0))),
                                ]),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Minuman"),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: lsmn.length,
                    itemBuilder: (context, int i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Minuman(
                                    minum: lsmn[i],
                                    itemCount: 1,
                                  )));
                        },
                        child: Hero(
                          tag:
                              mn[i], // Gunakan tag yang unik untuk setiap Hero
                          child: GridTile(
                            child: ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                '${mn[i]}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            footer: Container(
                              color: Color.fromARGB(255, 255, 255, 255),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 3),
                                child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          jdl[i],
                                          overflow: TextOverflow.ellipsis, // Memotong teks yang terlalu panjang
                                          maxLines: 1, // Memastikan hanya satu baris yang ditampilkan
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 0, 0, 0),
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                  // Text("${jdl[i]}",
                                  //     style: TextStyle(
                                  //         fontWeight: FontWeight.bold,
                                  //         color: const Color.fromARGB(
                                  //             255, 0, 0, 0))),
                                  Spacer(),
                                  Text(
                                      NumberFormat.currency(
                                        locale: 'id_ID',
                                        symbol: '',
                                        decimalDigits: 0,
                                      ).format(int.parse(hargamn[i])),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0))),
                                ]),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Keranjang()));
        },
        child: Icon(Icons.shopping_cart), // Add your desired icon here
      ),
    );
  }
}
