// ignore_for_file: prefer_const_constructors

import 'package:kerkom/cart.dart';
import 'package:flutter/material.dart';
import 'package:kerkom/detail.dart';
import 'package:flutter/widgets.dart';
import 'package:kerkom/provider.dart';
import 'package:provider/provider.dart';

class Makanan extends StatefulWidget {
  final Detail g;
  final int itemCount; // Tambahkan properti itemCount
  const Makanan(
      {Key? key,
      required this.g,
      required this.itemCount}); // Sertakan properti itemCount dalam konstruktor

  @override
  State<Makanan> createState() => _MakananState();
}

class _MakananState extends State<Makanan> {
  late int itemCount; // Deklarasikan itemCount di dalam kelas State

  @override
  void initState() {
    super.initState();
    itemCount = widget.itemCount; // Inisialisasi itemCount dari properti widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.g.judul}'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.g.fileName,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${widget.g.fileName}"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                widget.g.judul,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .kurangiItem(widget.g.judul, widget.g.itemCount);
                  },
                ),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, _) => Text(
                    cartProvider.getItemCount(widget.g.judul).toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .tambahItem(
                            widget.g.fileName,
                            widget.g.judul,
                            widget.g.harga,
                            widget.g.itemCount,
                            widget.g.namatoko);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                widget.g.desc,
                style: TextStyle(fontSize: 15),
              ),
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

class Minuman extends StatefulWidget {
  final Detail minum;
  final int itemCount; // Tambahkan properti itemCount
  const Minuman(
      {Key? key,
      required this.minum,
      required this.itemCount}); // Sertakan properti itemCount dalam konstruktor

  @override
  State<Minuman> createState() => _MinumanState();
}

class _MinumanState extends State<Minuman> {
  late int itemCount; // Deklarasikan itemCount di dalam kelas State

  @override
  void initState() {
    super.initState();
    itemCount = widget.itemCount; // Inisialisasi itemCount dari properti widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.minum.judul}'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.minum.fileName,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${widget.minum.fileName}"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                widget.minum.judul,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .kurangiItem(
                            widget.minum.judul, widget.minum.itemCount);
                  },
                ),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, _) => Text(
                    cartProvider.getItemCount(widget.minum.judul).toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .tambahItem(
                            widget.minum.fileName,
                            widget.minum.judul,
                            widget.minum.harga,
                            widget.minum.itemCount,
                            widget.minum.namatoko);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                widget.minum.desc,
                style: TextStyle(fontSize: 15),
              ),
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
