// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tugas_kelompok_semester4/project/home.dart';
import 'package:tugas_kelompok_semester4/project/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name = TextEditingController();
  TextEditingController pwd = TextEditingController();
  bool _isObscured = true;
  bool isfailed = false;
  @override
   Widget build(BuildContext context) {
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
              const TextField(
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
                  errorText: isfailed ? "Incorrect username dan password" : null,
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 49, 39, 39)),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(pwd.text == "test" & nama.text == "test"){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Home())
                      );
                    }
                    else{
                      isfailed = true;
                      pwd.text = "";
                      nama.text = "";
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  fixedSize: Size(310,50),
                ),
                child: Text("LOG IN")
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
                        MaterialPageRoute(builder: (context) => SignUp())
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
