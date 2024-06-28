import 'package:flutter/material.dart';
import 'package:kerkom/provider.dart';
import 'package:provider/provider.dart';

class AlamatPage extends StatefulWidget {
  @override
  State<AlamatPage> createState() => _AlamatPageState();
}

class _AlamatPageState extends State<AlamatPage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final alamatProvider = Provider.of<AccountProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Alamat"),
      ),
      body: ListView.builder(
        itemCount: alamatProvider.alamatList.length,
        itemBuilder: (context, index) {
          final alamat = alamatProvider.alamatList[index];
          final isSelected = alamatProvider.selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                alamatProvider.setAlamat(alamat, index);
                selectedIndex = index;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Alamat terpilih: ${alamat.nama}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,)),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? Colors.orange : Colors.grey,
                  width: 2,
                ),
              ),
              child: ListTile(
                title: Row(
                  children: [
                    Flexible(
                      child: Text(
                        alamat.nama,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Flexible(
                      child: Text(
                        alamat.detail,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "${alamat.nohp}",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  "Ongkir: Rp ${alamat.ongkir.toStringAsFixed(0)}",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
