import 'package:kerkom/contoh_prov.dart';
import 'package:kerkom/detail.dart';
import 'package:kerkom/navbar.dart';
import 'package:kerkom/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kerkom/providerbutton.dart';

void main() {
  runApp(MyApp());
}
var accounts = akun;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => ChatProvider()),
          ChangeNotifierProvider(create: (context) => DisappearProvider()),
          ChangeNotifierProvider(create: (context) => DarkProvider()),
          ChangeNotifierProvider(create: (context) => FontSizeProvider()),
        ChangeNotifierProvider(create: (context) => AccountProvider(initialAccounts: accounts)),
        ChangeNotifierProvider(create: (context) => CommentData()),
        ChangeNotifierProvider(create: (context) => PriorityProvider()),
        ChangeNotifierProvider(create: (context) => PromoProvider()),
        ChangeNotifierProvider(create: (context) => PrivacyProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => ThemeModeProvider()),
      ],
      child: Consumer<ThemeModeProvider>( 
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: Navbar(),
          );
        },
      ),
    );
  }
}
