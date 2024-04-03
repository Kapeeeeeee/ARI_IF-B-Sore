import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool lettuce = false, onion = false, pickle = false, tomato = false, cheese = false;
  String buns = "";
  double harga = 2.30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(
    //   title: Text("Halo Dek"),
    // ),
      body:
        Container(
        padding: EdgeInsets.only(left: 10.0),

        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network("https://www.eatingwell.com/thmb/aKA6WL4j01orJ6F7v9bF4PH6B7Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/air-fryer-cheeseburgers-9e0cf0071bcb4b8d9bc806cabfb61347.jpg",
                  width: MediaQuery.of(context).size.width , fit: BoxFit.fitWidth,
                ),
              ),

              SizedBox(height : 10,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: const Text("Beef Burger", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  SizedBox(width: 190,),
                  Text("\$${harga.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.star, color: Colors.orangeAccent,),
                    ),
                  Text("5.0 (19k reviews)")
                ],
              ),
              Padding(padding: EdgeInsets.all(10),
              child: Text("sejenis roti berbentuk bundar yang diiris dua, dan di \ntengahnya diisi dengan patty yang biasanya diambil dari \ndaging, sayuran berupa selada, tomat dan bawang bombai."),),

              Text("Toppings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                child: Row(
                  children: [
                    ChoiceChip(
                      label: Text("Lettuce",),
                      labelStyle: TextStyle(color: lettuce ? Colors.white : Colors.black),
                      checkmarkColor: lettuce ? Colors.white : Colors.black,
                      selected: lettuce,
                      selectedColor: Colors.lightGreenAccent,
                      onSelected: (val){
                        setState(() {
                          lettuce = val;
                          if(val){harga+=0.25;}
                          else{harga -=0.25;}
                        });
                      },
                    ),
                    SizedBox(width: 10,),
                    ChoiceChip(
                      label: Text("Onion",),
                      labelStyle: TextStyle(color: onion ? Colors.white : Colors.black),
                      checkmarkColor: onion ? Colors.white : Colors.black,
                      selected: onion,
                      selectedColor: Colors.purple,
                      onSelected: (val){
                        setState(() {
                          onion = val;
                          if(val){harga+=0.10;}
                          else{harga -=0.10;}
                        });
                      },
                    ),
                    SizedBox(width: 10,),
                    ChoiceChip(
                      label: Text("Pickle",),
                      labelStyle: TextStyle(color: pickle ? Colors.white : Colors.black),
                      checkmarkColor: pickle ? Colors.white : Colors.black,
                      selected: pickle,
                      selectedColor: Colors.lightGreen,
                      onSelected: (val){
                        setState(() {
                          pickle = val;
                          if(val){harga+=0.32;}
                          else{harga -=0.32;}
                        });
                      },
                    ),
                    SizedBox(width: 10,),
                    ChoiceChip(
                      label: Text("Tomato",),
                      labelStyle: TextStyle(color: tomato ? Colors.white : Colors.black),
                      checkmarkColor: tomato ? Colors.white : Colors.black,
                      selected: tomato,
                      selectedColor: Colors.redAccent,
                      onSelected: (val){
                        setState(() {
                          tomato = val;
                          if(val){harga+=0.40;}
                          else{harga -=0.40;}
                        });
                      },
                    ),
                    SizedBox(width: 10,),
                    ChoiceChip(
                      label: Text("Cheese",),
                      labelStyle: TextStyle(color: cheese ? Colors.white : Colors.black),
                      checkmarkColor: cheese ? Colors.white : Colors.black,
                      selected: cheese,
                      selectedColor: Colors.yellowAccent,
                      onSelected: (val){
                        setState(() {
                          cheese = val;
                          if(val){harga+=0.41;}
                          else{harga -=0.41;}
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text("Buns", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), ),
              Row(
                children: [

                  ChoiceChip(
                    label: Text("Reguler"),
                    labelStyle: TextStyle(color: buns=="Reguler" ? Colors.white : Colors.black),
                    checkmarkColor: buns=="Reguler" ? Colors.white : Colors.black,
                    selected: buns == "Reguler",
                    selectedColor: Colors.brown,
                    onSelected: (val){
                      setState(() {
                        if(buns != "Reguler"){
                          buns = "Reguler";
                          harga -= 0.20;
                        }
                      });
                    },
                  ),
                  SizedBox(width: 10,),
                  ChoiceChip(
                    label: Text("Wheat"),
                    labelStyle: TextStyle(color: buns=="Wheat" ? Colors.white : Colors.black),
                    checkmarkColor: buns=="Wheat" ? Colors.white : Colors.black,
                    selected: buns == "Wheat",
                    selectedColor: Colors.brown,
                    onSelected: (val){
                      setState(() {
                        if(buns != "Wheat"){
                          buns = "Wheat";
                          harga+=0.20;
                        }
                      });
                    },
                  ),
                ]
                ),
              SizedBox(height: 20,),
              Container(
                width: 500,
                  child : ElevatedButton(onPressed: (){},
                    child: Text("Pay"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white,),

                  )
              )



            ],
          ),


        ),
      ),

    );
  }
}
