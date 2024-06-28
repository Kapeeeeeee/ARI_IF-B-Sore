import 'package:flutter/material.dart';

class Chatting{
  String namaTeman;
  String profPic;
  List<Map<String, String>> daftarChat;

  Chatting({
    required this.namaTeman,
    required this.profPic,
    required this.daftarChat,
  });

  get value => null;
}

class ChatProvider extends ChangeNotifier {
  Map<String, Map<String, List<Map<String, String>>>> listPercakapan = {
    "Alex Ander Wijaya": {
      "Kenzie Pragata": [
        {"Kenzie Pragata": "Hello"},
        {"Alex Ander Wijaya": "Hello"},
        {"Kenzie Pragata": "Wyd?"},

      ],
      "Frederick Liko": [
        {"Frederick Liko": "Hello"},
        {"Alex Ander Wijaya": "Hello"},
        {"Frederick Liko": "Wyd?"},
      
      
      ],
      "Toko Clara": [
      ],
    },
    "Kenzie Pragata": {
      "Alex Ander Wijaya": [
        {"Kenzie Pragata": "Hello"},
        {"Alex Ander Wijaya": "Hello"},
        {"Kenzie Pragata": "Wyd?"},
      ],
      "Frederick Liko": [
        {"Frederick Liko": "Hello"},
        {"Kenzie Pragata": "Hello"},
        {"Frederick Liko": "Wyd?"},
      ],
    },
    "Toko Clara":{
      "Kenzie Pragata":[

      ]

    }
  };

  void addChat(String sender, String receiver, Map<String, String> chat) {
    listPercakapan[sender]?[receiver]?.add(chat);
    listPercakapan[receiver]?[sender]?.add(chat);
    notifyListeners();
  }

  void removeChat(String sender, String receiver) {
    listPercakapan[receiver]?[sender]?.clear();
    listPercakapan[sender]?[receiver]?.clear();
    notifyListeners();
  }

 void sendAutomaticMessage(String sender, String receiver, String message) {
    if (!listPercakapan.containsKey(sender)) {
        listPercakapan[sender] = {};
    }
    if (!listPercakapan.containsKey(receiver)) {
        listPercakapan[receiver] = {};
    }

    if (!listPercakapan[sender]!.containsKey(receiver)) {
        listPercakapan[sender]![receiver] = [];
    }
    if (!listPercakapan[receiver]!.containsKey(sender)) {
        listPercakapan[receiver]![sender] = [];
    }

    addChat(sender, receiver, {sender: message});
}




}


class DisappearProvider extends ChangeNotifier{
  int groupVal = 2;

  void changeVal(int val){
    groupVal = val;
    notifyListeners();
  }
}

class DarkProvider extends ChangeNotifier{
  bool isDark = false;

  void changeMode(){
    isDark = !isDark;
    notifyListeners();
  }
}

class FontSizeProvider with ChangeNotifier {
  double _sliderValue = 50;

  double get sliderValue => _sliderValue;

  double get fontSize => _sliderValue / 50 * 14;

  void setSliderValue(double newValue) {
    _sliderValue = newValue;
    notifyListeners();
  }
}
