import 'package:flutter/material.dart';

class PrivacyProvider extends ChangeNotifier{
  int selected = 0 ;

  void choice (val){
    selected=val;
    notifyListeners();

  }
}

class NotificationProvider extends ChangeNotifier{
  int selected = 0 ;

  void choice(val){
    selected = val ;
    notifyListeners();
  }
}

