// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kerkom/detail.dart';

class Profile extends StatelessWidget {
  final Account p;
  const Profile({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${p.namauser} Profile")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: p.foto,
              child: Center(
                child: Container(

                  width: 200,
                  height: MediaQuery.of(context).size.height/2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // ignore: unnecessary_string_interpolations
                      image: NetworkImage("${p.foto}"),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 10),
            Text(p.namauser, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(p.deskripsi, style: TextStyle(fontSize: 15)),
            SizedBox(height: 10),
            Text(p.nohp, style: TextStyle(fontSize: 15))

          ],
        ),
      ),
    );
  }
}
