import 'package:flutter/material.dart';

class accSafety extends StatefulWidget {
  const accSafety({super.key});

  @override
  State<accSafety> createState() => _accSafetyState();
}

class _accSafetyState extends State<accSafety> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Safety"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  "Berisi settingan akun seperti 2 step authentication, finger print ( mungkin ), dll"),
            )
          ],
        ),
      ),
    );
  }
}
