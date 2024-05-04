import 'package:kerkom/project/home.dart';
import 'package:kerkom/project/tampilan_produk.dart';
import 'package:flutter/material.dart';
import 'package:kerkom/project/detail.dart'; // Import file yang berisi definisi objek Detail

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Detail> searchResults = [];
  String? filterType; // Inisialisasi filterType dengan null
  int? minPrice;
  int? maxPrice;

  // Fungsi pencarian
  void _search(String query) {
    // Bersihkan daftar hasil pencarian sebelum melakukan pencarian baru
    searchResults.clear();
    if (query.isEmpty) {
      setState(() {
        Text('Tidak ada hasil yang ditemukan');
      });
    }
    // Loop melalui semua objek Detail dari file detail_data.dart
    for (var detail in semua) {
      // Jika judul produk mengandung kata kunci pencarian dan memenuhi kriteria harga, tambahkan ke daftar hasil
      if (detail.judul.toLowerCase().contains(query.toLowerCase()) &&
          (filterType == null || detail.type == filterType) &&
          (minPrice == null || detail.harga >= minPrice!) &&
          (maxPrice == null || detail.harga <= maxPrice!)) {
        searchResults.add(detail);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pencarian"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(10.0),
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
                  hintText: 'Masukkan kata kunci dari nama makanan yang Anda cari',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10), // Jarak antara TextField dan ChoiceChip
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: Text("Makanan"),
                    selected: filterType == 'Makanan',
                    onSelected: (isSelected) {
                      setState(() {
                        filterType = isSelected ? 'Makanan' : null; // Mengatur filterType berdasarkan isSelected
                        _search(_searchController.text); // Panggil kembali fungsi pencarian dengan filter baru
                      });
                    },
                  ),
                  SizedBox(width: 10), // Jarak antara ChoiceChip
                  ChoiceChip(
                    label: Text("Minuman"),
                    selected: filterType == 'Minuman',
                    onSelected: (isSelected) {
                      setState(() {
                        filterType = isSelected ? 'Minuman' : null; // Mengatur filterType berdasarkan isSelected
                        _search(_searchController.text); // Panggil kembali fungsi pencarian dengan filter baru
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10), // Jarak antara ChoiceChip dan TextField untuk harga
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: Text("Harga 1000-5000"),
                    selected: minPrice == 1000 && maxPrice == 5000,
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          minPrice = 1000;
                          maxPrice = 5000;
                        } else {
                          minPrice = null;
                          maxPrice = null;
                        }
                        _search(_searchController.text); // Panggil kembali fungsi pencarian dengan filter baru
                      });
                    },
                  ),
                  SizedBox(width: 10), // Jarak antara ChoiceChip
                  ChoiceChip(
                    label: Text("Harga 5001-10000"),
                    selected: minPrice == 5001 && maxPrice == 10000,
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          minPrice = 5001;
                          maxPrice = 10000;
                        } else {
                          minPrice = null;
                          maxPrice = null;
                        }
                        _search(_searchController.text); // Panggil kembali fungsi pencarian dengan filter baru
                      });
                    },
                  ),
                  SizedBox(width: 10), // Jarak antara ChoiceChip
                  ChoiceChip(
                    label: Text("Harga 10001-20000"),
                    selected: minPrice == 10001 && maxPrice == 20000,
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          minPrice = 10001;
                          maxPrice = 20000;
                        } else {
                          minPrice = null;
                          maxPrice = null;
                        }
                        _search(_searchController.text); // Panggil kembali fungsi pencarian dengan filter baru
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20), // Jarak antara ChoiceChip dan hasil pencarian
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
                              width: 300,
                              height: 200,
                            ),
                            subtitle: Column(
                              children: [
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(result.namatoko),
                                    ),
                                    SizedBox(width: 8),
                                    Flexible(child: Text(result.judul)),
                                    SizedBox(width: 8),
                                    Flexible(
                                      child: Text(result.rating),
                                    ),
                                    SizedBox(width: 8),
                                    Flexible(
                                      child: Text(result.harga.toString()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            onTap: () {
                              if (result.type == 'Minuman') {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Minuman(
                                    minum: searchResults[index],
                                    itemCount: 0,
                                  ),
                                ));
                              } else if (result.type == 'Makanan') {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Makanan(
                                    g: searchResults[index],
                                    itemCount: 0,
                                  ),
                                ));
                              }
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
