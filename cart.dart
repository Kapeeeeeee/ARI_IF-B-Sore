
import 'package:tugas_kelompok_semester4/project/detail.dart';
import 'package:tugas_kelompok_semester4/project/pembayaran.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok_semester4/project/provider.dart';


class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}


class _KeranjangState extends State<Keranjang> {
  Map<String, bool> _selectedStores = {};
  bool terisi  = false ;
  List<CartItem> selectedItems = [];

  
  @override
  Widget build(BuildContext context) {
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;
    final cartProvider = Provider.of<AccountProvider>(context);
    final List<CartItem> items = currentUser.cart;
    Map<String, int> jumlahItemPerToko = {};

    for (var item in items) {
      jumlahItemPerToko[item.namatoko] =
          (jumlahItemPerToko[item.namatoko] ?? 0) + item.itemCount;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: items.isEmpty
          ? Center(
              child: Text(
                'Keranjang Kosong',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: jumlahItemPerToko.length,
              itemBuilder: (context, index) {
                final toko = jumlahItemPerToko.keys.elementAt(index);
                final jumlahItem = jumlahItemPerToko[toko];
                final produkToko =
                    items.where((item) => item.namatoko == toko).toList();

                return ExpansionTile(
                  leading: Checkbox(
                    value: _selectedStores[toko] ?? false,
                    onChanged: (value) {
                      setState(() {
                        _selectedStores[toko] = value!;
                        terisi = false;
                        for (var item in produkToko) {
                          cartProvider.toggleItemSelection(item);
                          if (value == true){ 
                            terisi = true ;}
                        }
                      });
                    },
                  ),
                  title: Text(toko),
                  subtitle: Text('Jumlah Item: $jumlahItem'),
                  children: [
                    for (var item in produkToko)
                      ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(item.gambar),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(item.itemName),
                        subtitle: Text(
                            'Harga: ${item.harga}, Jumlah: ${item.itemCount}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                cartProvider.kurangiItem(item.itemName, 1);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                cartProvider.tambahItem(
                                  item.gambar,
                                  item.itemName,
                                  item.harga,
                                  1,
                                  item.namatoko,
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                cartProvider.hapusItem(
                                    item); // Panggil fungsi hapusItem dari provider
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
  
  
   floatingActionButton: _selectedStores.containsValue(true)
    ? FloatingActionButton(
        onPressed: () {
          for (var item in items) {
            if (_selectedStores.containsKey(item.namatoko) &&
                _selectedStores[item.namatoko]!) {
              selectedItems.add(item);
              cartProvider.toggleItemSelection(item);
            }
          }
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Pembayaran(selectedItems: selectedItems)));
        },
        child: Icon(Icons.checklist),
      )
    : null,



    );
  }
}
