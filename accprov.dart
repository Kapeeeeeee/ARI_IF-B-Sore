import 'package:flutter/material.dart';

class Login{
  String username;
  String password;
  Login({
    this.username = "",
    this.password = "",
  });
}
class LoginProvider extends ChangeNotifier{
  List<Login> myLogin = [
    Login(
      username: "alexanderwijaya",
      password: "123456",
    ),
    Login(
      username: "frederickliko",
      password: "123456",
    ),
    Login(
      username: "kenziepragata",
      password: "123456",
    ),
    Login(
      username: "richardowijaya",
      password: "123456",
    ),
  ];
  void addAcc(Login p){
    myLogin.add(p);
    notifyListeners();
  }
}