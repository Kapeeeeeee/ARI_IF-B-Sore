// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok_semester4/project/autoscroll.dart';
import 'package:tugas_kelompok_semester4/project/camera.dart';
import 'package:tugas_kelompok_semester4/project/cart.dart';
import 'package:tugas_kelompok_semester4/project/profile.dart';
import 'package:tugas_kelompok_semester4/project/provider.dart';
import 'package:tugas_kelompok_semester4/project/search.dart';
import 'package:tugas_kelompok_semester4/project/settings.dart';
import 'package:tugas_kelompok_semester4/project/wallet.dart';
import 'package:flutter/material.dart';
import 'package:tugas_kelompok_semester4/project/detail.dart';
import 'package:camera/camera.dart';

import 'package:tugas_kelompok_semester4/project/tampilan_produk.dart';
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
final List itemCount = [
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

final List ls1 = [m1, m2, m3, m4, m5, m6, m7, m8, m9, m10];
final List semua = [
  m1,
  m2,
  m3,
  m4,
  m5,
  m6,
  m7,
  m8,
  m9,
  m10,
  mn1,
  mn2,
  mn3,
  mn4,
  mn5,
  mn6,
  mn7,
  mn8,
  mn9,
  mn10
];
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
final List itemCountmn = [
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

final List lsmn = [mn1, mn2, mn3, mn4, mn5, mn6, mn7, mn8, mn9, mn10];

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
  bool isEyeOpen = true;
  bool isAmountVisible = true;
  void toggleEye() {
    setState(() {
      isEyeOpen = !isEyeOpen;
      isAmountVisible = !isAmountVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hallo ${currentUser.namauser}"),
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
                builder: (context) => Profile(),
              ));
            },
            icon: CircleAvatar(
              backgroundImage: NetworkImage("${currentUser.foto}"),
              radius: 25, // Sesuaikan dengan kebutuhan Anda
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Settings()));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(235, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 199, 194, 194)
                                .withOpacity(0.5), // Warna bayangan
                            spreadRadius: 5, // Menyebar bayangan
                            blurRadius: 7, // Memperluas bayangan
                            offset: Offset(0,
                                3), // Perpindahan bayangan secara horizontal dan vertikal
                          ),
                        ],
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      width: 270,
                      height: 90,
                      padding: EdgeInsets.all(13),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Saldo Anda",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                  isAmountVisible
                                      ? NumberFormat.currency(
                                          locale: 'id_ID',
                                          symbol: '',
                                          decimalDigits: 0,
                                        ).format(int.parse(
                                          currentUser.uang.toString()))
                                      : '********',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              IconButton(
                                iconSize: 20,
                                onPressed: toggleEye,
                                icon: isEyeOpen
                                    ? Icon(Icons.remove_red_eye_rounded)
                                    : Icon(Icons.remove_red_eye_sharp),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              IconButton(
                                  iconSize: 25,
                                  onPressed: () {},
                                  icon: Icon(Icons.add_box)),
                                   Text("Top up",
                                  style: TextStyle(
                                    fontSize: 10
                                  ),)
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              IconButton(
                                  iconSize: 25,
                                  onPressed: () async {
                                    final cameras =
                                        await availableCameras(); // Dapatkan daftar kamera yang tersedia
                                    final firstCamera = cameras.firstWhere(
                                        (camera) =>
                                            camera.lensDirection == CameraLensDirection.front); // Pilih kamera belakang
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CameraScreen(camera: firstCamera),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.qr_code)),
                                  Text("qr scan",
                                  style: TextStyle(
                                    fontSize: 10
                                  ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(height: 30),
            Text(
                "Hallo ${currentUser.namauser} Apa yang kamu mau pesan hari ini"),
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
                Text(
                  "Makanan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: ls.length,
                    itemBuilder: (context, int i) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Makanan(
                                  g: ls1[i], itemCount: itemCount[i]);
                            }));
                          },
                          child: Hero(
                            tag: ls[
                                i], // Gunakan tag yang unik untuk setiap Hero
                            child: GridTile(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    clipBehavior: Clip.antiAlias,
                                    child: AspectRatio(
                                      aspectRatio: 1.3,
                                      child: Image.network(
                                        '${ls[i]}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            "${txt[i]}",
                                            maxLines: 1,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
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
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
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
                Text(
                  "Minuman",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: lsmn.length,
                    itemBuilder: (context, int i) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Minuman(
                                  minum: lsmn[i], itemCount: itemCountmn[i]);
                            }));
                          },
                          child: Hero(
                            tag: mn[
                                i], // Gunakan tag yang unik untuk setiap Hero
                            child: GridTile(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    clipBehavior: Clip.antiAlias,
                                    child: AspectRatio(
                                      aspectRatio: 1.3,
                                      child: Image.network(
                                        '${mn[i]}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${jdl[i]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                            NumberFormat.currency(
                                              locale: 'id_ID',
                                              symbol: '',
                                              decimalDigits: 0,
                                            ).format(int.parse(hargamn[i])),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
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
