// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tugas_kelompok_semester4/project/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _Signup();
}

bool isError = false;

class _Signup extends State<Signup> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up page"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Image(
                image: AssetImage('logo.png'),
                width: 250,
              )),
              TextField(
                controller: t3,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 146, 146, 146),
                            width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)),
                    labelText: "Nama",
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: "Isikan nama kamu disini",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.person),
                    errorText: isError ? "masukan nama yang valid" : null),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: t1,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 146, 146, 146),
                            width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: "Isikan Password kamu disini",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.lock),
                    errorText: isError ? "Wrong password" : null),
                obscureText: true,
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: t2,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 146, 146, 146),
                            width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: "Isikan ulang password kamu disini",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.lock),
                    errorText: isError ? "password tidak sesuai" : null),
                obscureText: true,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (t1.text.isNotEmpty &&
                            t2.text.isNotEmpty &&
                            t3.text.isNotEmpty &&
                            t1.text == t2.text) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signin()));
                        } else {
                          // Menampilkan pesan kesalahan jika tidak semua field terisi atau password tidak sesuai
                          isError = true;
                        }
                      });
                    },
                    child: Text("Sign up"),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red),
                  )),
              SizedBox(
                height: 10,
              ),
              Text("OR"),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("google.png"),
                            height: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Sign up with Google")
                        ]),
                    
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Signin()));
                  },
                  child: Text("Have an Account ? Sign in "),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
