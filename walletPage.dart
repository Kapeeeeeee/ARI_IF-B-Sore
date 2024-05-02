import 'package:flutter/material.dart';
import 'wallet.dart';
import 'provider.dart';
import 'package:provider/provider.dart';
import 'detail.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;

    return Row(
      children: [
        Flexible(
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Wallet()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0),
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10), // Atur radius sesuai keinginan Anda
              ),
              child: Column(
                children: [
                  Text(
                    "Wallet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${currentUser.uang}",
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
