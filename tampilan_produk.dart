import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kerkom/cart.dart';
import 'package:kerkom/commentpage.dart';
import 'package:kerkom/detail.dart';
import 'package:provider/provider.dart';
import 'package:kerkom/provider.dart';

class Makanan extends StatelessWidget {
  final Detail g;
  final int itemCount;

  const Makanan({Key? key, required this.g, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${g.judul}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: g.fileName,
              child: Container(
                height: 300, // Tentukan tinggi sesuai kebutuhan Anda
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(g.fileName),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    g.judul,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentPage(itemName: g.judul,),
                          ),
                          (route) => false,
                        );
                      },
                      icon: Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                    Text(
                      g.rating.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: '',
                          decimalDigits: 0,
                        ).format(int.parse(g.harga.toString())),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.remove, color: Colors.white),
                    onPressed: () {
                      Provider.of<AccountProvider>(context, listen: false)
                          .kurangiItem(g.judul, itemCount);
                    },
                  ),
                ),
                SizedBox(width: 10),
                Consumer<AccountProvider>(
                  builder: (context, cartProvider, _) => Text(
                    cartProvider.getItemCount(g.judul).toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      Provider.of<AccountProvider>(context, listen: false)
                          .tambahItem(
                        g.fileName,
                        g.judul,
                        g.harga,
                        g.itemCount,
                        g.namatoko,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              g.desc,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Keranjang()),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Minuman extends StatelessWidget {
  final Detail minum;
  final int itemCount;

  const Minuman({Key? key, required this.minum, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${minum.judul}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: minum.fileName,
              child: Container(
                height: 300, // Tentukan tinggi sesuai kebutuhan Anda
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(minum.fileName),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  minum.judul,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => CommentPage(itemName:minum.judul ,)),
                        );
                      },
                      icon: Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                    Text(
                      minum.rating.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                        NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: '',
                          decimalDigits: 0,
                        ).format(int.parse(minum.harga.toString())),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.remove, color: Colors.white),
                    onPressed: () {
                      Provider.of<AccountProvider>(context, listen: false)
                          .kurangiItem(minum.judul, itemCount);
                    },
                  ),
                ),
                SizedBox(width: 10),
                Consumer<AccountProvider>(
                  builder: (context, cartProvider, _) => Text(
                    cartProvider.getItemCount(minum.judul).toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      Provider.of<AccountProvider>(context, listen: false)
                          .tambahItem(
                        minum.fileName,
                        minum.judul,
                        minum.harga,
                        minum.itemCount,
                        minum.namatoko,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              minum.desc,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Keranjang()),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
