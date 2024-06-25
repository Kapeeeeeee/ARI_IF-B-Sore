import 'package:flutter/material.dart';
import 'package:kerkom/project/detail.dart';
import 'package:kerkom/project/provider.dart';
import 'package:provider/provider.dart';


class Metode extends StatefulWidget {
  @override
  _MetodeState createState() => _MetodeState();
}

class _MetodeState extends State<Metode> {
  int selectedMethodIndex = -1;

  @override
  Widget build(BuildContext context) {
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;
    return Scaffold(
      appBar: AppBar(
        title: Text("Metode Pembayaran"),
      ),
      body: ListView.builder(
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedMethodIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width/1.2,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  border: Border.all(
                      color: selectedMethodIndex == index ? Colors.orangeAccent : Colors.black,
                      width: 1,
                    ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Icon(paymentMethods[index].icon),
                            SizedBox(width: 10),
                            Text(
                              paymentMethods[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (index != 1) // Menampilkan Balance hanya jika item tidak dipilih
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text("Balance: ${currentUser.uang}"),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
