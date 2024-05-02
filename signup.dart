// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok_semester4/project/login.dart';
import 'package:tugas_kelompok_semester4/project/accprov.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController pwd1 = TextEditingController();
  bool _isObscured = true;
  bool isObscure = true;
  bool isfailed = false;
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGN UP"),
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
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 49, 39, 39)),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              SizedBox(height: 40,),

              TextFormField(
                controller: pwd1,
                style: TextStyle(
                  color: Colors.blue
                ),
                obscureText: isObscure,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent)
                  ),
                  labelText: "Password",
                  suffixIcon: IconButton(
                  icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ),
                  hintText: "Isikan ulang password kamu disini",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 49, 39, 39)),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(pwd1.text == pwd.text){
                      Login p = Login(username: name.text, password: pwd1.text);
                      Provider.of<LoginProvider>(context, listen: false).addAcc(p);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LogIn())
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  fixedSize: Size(310,50),
                ),
                child: Text("SIGN UP")
              ),
              
              SizedBox(height: 40,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(width: 25,),
                  TextButton(
                onPressed: (){setState(() {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LogIn())
                );
                  });},
                child: Text("LOG IN"),
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
