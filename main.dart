import 'package:tugas_kelompok_semester4/project/detail.dart';
import 'package:tugas_kelompok_semester4/project/home.dart';
import 'package:tugas_kelompok_semester4/project/postingan.dart';
import 'package:tugas_kelompok_semester4/project/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok_semester4/project/providerbutton.dart';
import 'package:tugas_kelompok_semester4/project/signup.dart';

void main() {
  runApp(MyApp());
}
var accounts = [p1, p2, p3,p4];
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider(initialAccounts: accounts)),
        ChangeNotifierProvider(create: (context) => PostingProvider()),
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
            home: Home(),
          );
        },
      ),
    );
  }
}
