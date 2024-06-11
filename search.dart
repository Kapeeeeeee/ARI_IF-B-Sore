import 'package:flutter/widgets.dart';
import 'package:kerkom/home.dart';
import 'package:kerkom/tampilan_produk.dart';
import 'package:flutter/material.dart';
import 'package:kerkom/detail.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Detail> searchResults = [];
  String? filterType;
  int? minPrice;
  int? maxPrice;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _search(String query) {
    searchResults.clear();
    if (query.isEmpty) {
      setState(() {
        Text('Tidak ada hasil yang ditemukan');
      });
    }
    for (var detail in semua) {
      if (detail.judul.toLowerCase().contains(query.toLowerCase()) &&
          (filterType == null || detail.type == filterType) &&
          (minPrice == null || detail.harga >= minPrice!) &&
          (maxPrice == null || detail.harga <= maxPrice!)) {
        searchResults.add(detail);
      }
    }
    setState(() {});
  }

  void _showFilterDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  void _handleFilterChanged(String? filterType, int? minPrice, int? maxPrice) {
    setState(() {
      this.filterType = filterType;
      this.minPrice = minPrice;
      this.maxPrice = maxPrice;
      _search(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Pencarian"),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: _showFilterDrawer,
          ),
        ],
      ),
      endDrawer: FilterDrawer(
        onFilterChanged: _handleFilterChanged,
      ),
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    _search(value);
                  },
                  decoration: InputDecoration(
                    hintText:
                        'Masukkan kata kunci dari nama makanan yang Anda cari',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(

                child: searchResults.isEmpty
                    ? Center(
                        child: Text("Tidak ada hasil yang ditemukan"),
                      )
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ListView.builder(
                          itemCount: searchResults.length,
                          itemBuilder: (context, index) {
                            var result = searchResults[index];
                            return Container(
                              height: 300,
                              width: 100,
                              child: Card(
                                child: ListTile(
                                  title:  Container(
                                    width: 100,
                                    height: 200,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        result.fileName,
                                        fit: BoxFit.cover,
                                    
                                                                  
                                      ),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(result.judul),
                                      Text(result.namatoko),
                                      Text(result.rating),
                                      Text('Rp ${result.harga}'),
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
                                ),
                              ),
                            );
                          },
                        ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterDrawer extends StatefulWidget {
  final Function(String?, int?, int?) onFilterChanged;

  FilterDrawer({required this.onFilterChanged});

  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  String? filterType;
  int? minPrice;
  int? maxPrice;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tipe Produk',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: ChoiceChip(
                            label: Text("Makanan"),
                            selected: filterType == 'Makanan',
                            onSelected: (isSelected) {
                              setState(() {
                                filterType = isSelected ? 'Makanan' : null;
                                widget.onFilterChanged(
                                    filterType, minPrice, maxPrice);
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: ChoiceChip(
                            label: Text("Minuman"),
                            selected: filterType == 'Minuman',
                            onSelected: (isSelected) {
                              setState(() {
                                filterType = isSelected ? 'Minuman' : null;
                                widget.onFilterChanged(
                                    filterType, minPrice, maxPrice);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Harga',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    ChoiceChip(
                      label: Text("Harga 1000>"),
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
                          widget.onFilterChanged(filterType, minPrice, maxPrice);
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Text("Harga 5000>"),
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
                          widget.onFilterChanged(filterType, minPrice, maxPrice);
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Text("Harga 10000>"),
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
                          widget.onFilterChanged(filterType, minPrice, maxPrice);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}