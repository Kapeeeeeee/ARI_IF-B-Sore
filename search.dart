import 'package:kerkom/home.dart';
import 'package:kerkom/tampilan_produk.dart';
import 'package:flutter/material.dart';
import 'package:kerkom/detail.dart'; // Import file yang berisi definisi objek Detail

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Detail> searchResults = [];

  // Fungsi pencarian
  void _search(String query) {
    // Bersihkan daftar hasil pencarian sebelum melakukan pencarian baru
    searchResults.clear();
    if (query.isEmpty) {
      setState(() {
        Text('Tidak ada hasil yang di temukan');
      });
    }
    // Loop melalui semua objek Detail dari file detail_data.dart
    for (var detail in ls1) {
      // Jika judul produk mengandung kata kunci pencarian, tambahkan ke daftar hasil
      if (detail.judul.toLowerCase().contains(query.toLowerCase())) {
        searchResults.add(detail);
      }
    }
    // Perbarui tampilan dengan hasil pencarian baru
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                // Panggil fungsi pencarian setiap kali teks dalam TextField berubah
                _search(value);
              },
              decoration: InputDecoration(
                hintText: 'Masukan kata kunci dari nama makanan yang anda cari',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20),
            // Tampilkan hasil pencarian di sini

            Expanded(
              child: searchResults.isEmpty
                  ? Center(
                      child: Text("Tidak ada hasil yang ditemukan"),
                    )
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        var result = searchResults[index];
                        return ListTile(
                          title: Image.network(
                            result.fileName,
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(result.namatoko),
                              ),
                              SizedBox(
                                  width:
                                      8),
                              Flexible(child: Text(result.judul)),
                              SizedBox(width: 8,),
                              Flexible(
                                child: Text(result.rating),
                              ),
                              SizedBox(
                                  width: 8), // Jarak antara rating dan harga
                              Flexible(
                                child: Text(result.harga.toString()),
                              ),
                            ],
                          ),
                          onTap: () {
                            if (result.type == 'Minuman') {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Minuman(minum: searchResults[index], itemCount: 0,)));
                            } else if (result.type == 'Makanan') {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Makanan(g: searchResults[index], itemCount: 0)));
                            } 
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
