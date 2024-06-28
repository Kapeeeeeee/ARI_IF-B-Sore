// import 'package:flutter/foundation.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kerkom/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:kerkom/signup.dart';
// import 'package:kerkom/detail.dart';
import 'package:kerkom/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController name = TextEditingController();
  TextEditingController pwd = TextEditingController();
  bool _isObscured = true;
  bool isfailed = false;
  bool isLoggedIn = false;
  @override
   Widget build(BuildContext context) {
    // Account currentUser = Provider.of<AccountProvider>(context).currentAccount;
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(backgroundImage: AssetImage("logo.png"),radius: 50,),
              SizedBox(height: 50,),
              TextField(
                controller: name,
                style: TextStyle(
                  color: Colors.blue
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent)
                  ),
                  labelText: "Username",
                  hintText: "Isikan nama kamu disini",
                  errorText: isfailed ? "Incorrect username" : null,
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              SizedBox(height: 40,),

              TextFormField(
                controller: pwd,
                style: TextStyle(
                  color: Colors.blue
                ),
                obscureText: _isObscured,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent)
                  ),
                  labelText: "Password",
                  suffixIcon: IconButton(
                  icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
                  hintText: "Isikan password kamu disini",
                  errorText: isfailed ? "Incorrect password" : null,
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 49, 39, 39)),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {

                  for (var e in Provider.of<AccountProvider>(context, listen: false).accounts) {
                    if (pwd.text == e.password && name.text == e.namauser) {
                      Provider.of<AccountProvider>(context, listen: false).switchAccount(e);
                      isLoggedIn = true; 
                      break;
                    }
                  }
    
                  if (isLoggedIn) {
                    Navigator.pushReplacement( context,
                      MaterialPageRoute(builder: (context) => SplashScreen( )),
                    );
                  } else {
                    setState(() {
                      isfailed = true;
                      pwd.text = ""; 
                      name.text = ""; 
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  fixedSize: Size(310, 50),
                ),
                child: Text("LOG IN"),
              ),
              
              SizedBox(height: 40,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 25,),
                  TextButton(
                onPressed: (){setState(() {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Signup())
                );
                  });},
                child: Text("Sign Up"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                ),
              ),
              ],),
            ],
          ),
        ),
      ),
    );
  }
}
