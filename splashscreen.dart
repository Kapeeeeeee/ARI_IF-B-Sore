import 'package:flutter/material.dart';
//pubspek dl flutter_spinkit
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kerkom/navbar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void nextPage(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>Navbar())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    nextPage(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logging\nIn",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30),
            SpinKitHourGlass(
              color: Colors.white,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}