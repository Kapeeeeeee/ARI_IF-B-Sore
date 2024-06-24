import 'package:flutter/material.dart';

class ItemCounter extends StatefulWidget {
  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (itemCount > 0) {
                itemCount--;
              }
            });
          },
        ),
        Text(
          itemCount.toString(),
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
          icon: Icon(Icons.add),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent), // Latar belakang transparan
              overlayColor: MaterialStateProperty.all(Colors.transparent), // Warna overlay transparan
              padding: MaterialStateProperty.all(EdgeInsets.all(16)), // Padding
              shape: MaterialStateProperty.all(CircleBorder()), // Bentuk lingkaran
              elevation: MaterialStateProperty.all(10), // Elevasi
              ),
          onPressed: () {
            setState(() {
              itemCount++;
            });
          },
          
        ),
      ],
    );
  }
}

