import 'package:flutter/material.dart';

class changeLanguage extends StatefulWidget {
  const changeLanguage({super.key});

  @override
  State<changeLanguage> createState() => _changeLanguageState();
}

class _changeLanguageState extends State<changeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Language"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "Berisi settingan pilihan untuk memilih bahasa pada tampilan ui aplikasi ( inggris atau indonesia )"),
            )
          ],
        ),
      ),
    );
  }
}
