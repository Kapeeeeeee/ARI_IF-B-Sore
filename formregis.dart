import 'package:flutter/material.dart';
import 'package:kerkom/home.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
    TextEditingController foto = TextEditingController();
    TextEditingController deskripsi = TextEditingController();
    TextEditingController nohp = TextEditingController();
    TextEditingController uang = TextEditingController();
    TextEditingController alamat = TextEditingController();
    TextEditingController detail = TextEditingController();

    bool isfailed = false;
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FORM"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: foto,
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
                  labelText: "Foto Profil",
                  hintText: "Isikan link foto profil",
                  errorText: isfailed ? "Harus Diisi" : null,
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.camera_alt),
                ),
              ),

              SizedBox(height: 40,),

              TextFormField(
                controller: deskripsi,
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
                  labelText: "Deskripsi",
                  hintText: "Isikan detail tentang dirimu",
                  errorText: isfailed ? "Harus Diisi" : null,
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 49, 39, 39)),
                  prefixIcon: Icon(Icons.description),
                ),
              ),

              SizedBox(height: 40,),

              TextFormField(
                controller: nohp,
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
                  labelText: "Nomor Handphone",
                  hintText: "Isikan Nomor Handphone kamu",
                  errorText: isfailed ? "Harus Diisi" : null,
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 49, 39, 39)),
                  prefixIcon: Icon(Icons.phone_android_rounded),
                ),
              ),

              SizedBox(height: 40,),

              TextFormField(
                controller: uang,
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
                  labelText: "Saldo awal",
                  hintText: "Isikan saldo awal kamu",
                  errorText: isfailed ? "Harus Diisi" : null,
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 49, 39, 39)),
                  prefixIcon: Icon(Icons.wallet_rounded),
                ),
              ),

              SizedBox(height: 40,),

              TextFormField(
                controller: alamat,
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
                  labelText: "Alamat",
                  hintText: "Isikan Alamat Rumah kamu",
                  errorText: isfailed ? "Harus Diisi" : null,
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 49, 39, 39)),
                  prefixIcon: Icon(Icons.home_filled),
                ),
              ),

              SizedBox(height: 40,),

              TextFormField(
                controller: detail,
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
                  labelText: "Detail Rumah",
                  hintText: "Isikan Detail rumah alamat kamu",
                  errorText: isfailed ? "Harus Diisi" : null,
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 49, 39, 39)),
                  prefixIcon: Icon(Icons.details),
                ),
              ),

              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  if (foto.text != "" && deskripsi.text != "" && nohp.text != ""
                  && uang.text != "" && alamat.text != "" && detail.text != "") {
                    Navigator.pushReplacement( context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  } else {
                    setState(() {
                      isfailed = true;
                      deskripsi.text = ""; 
                      foto.text = ""; 
                      nohp.text = ""; 
                      uang.text = ""; 
                      alamat.text = ""; 
                      detail.text = ""; 
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  fixedSize: Size(310, 50),
                ),
                child: Text("SUBMIT FORM"),
              ),
              
              
              ],),
          ),
        ),
      );
  }
}