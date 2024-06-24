import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kerkom/detail.dart';
import 'package:kerkom/provider.dart';
import 'package:provider/provider.dart';

class Metode extends StatefulWidget {
  const Metode({super.key});

  @override
  State<Metode> createState() => _MetodeState();
}

class _MetodeState extends State<Metode> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
  Account currentUser = Provider.of<AccountProvider>(context).currentAccount;
    return Scaffold(
      appBar: AppBar(
        title: Text("Metode Pembayaran"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text("Jenis Pembayaran"),
              decoration: BoxDecoration(
                color: Colors.white12,
                border : Border(
                  top: BorderSide(width: 1.0, color: Colors.black38), // Atas
                  bottom: BorderSide(width: 1.0, color: Colors.black38),
                ),
              )
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          border : Border(
                            top: BorderSide(color: isClicked ? Colors.black : Colors.orangeAccent,
                            width: 1),
                            bottom: BorderSide(color: isClicked ? Colors.black : Colors.orangeAccent,
                                width: 1)
                          ),
                        ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_balance_wallet_rounded),
                              Text("ARI Wallet", style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                              ),),
                              Icon(Icons.new_releases_outlined, size: 15,color: Colors.red,),
                            ],
                          ),
                          Text("Balance : ${currentUser.uang}")
                        ],
                      ),

                    ),
                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          border : Border(
                            top: BorderSide(color: isClicked ? Colors.black : Colors.orangeAccent,
                            width: 1),
                            bottom: BorderSide(color: isClicked ? Colors.black : Colors.orangeAccent,
                                width: 1)
                          ),
                        ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.money),
                              Text("Cash", style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),
                          Text("Balance : ${currentUser.uang}")
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
