import 'package:flutter/material.dart';
import 'package:kerkom/detail.dart';


class AccountProvider extends ChangeNotifier {
  var _accounts =akun;
  late Account _currentAccount;

  AccountProvider({List<Account>? initialAccounts}) {
    _accounts = initialAccounts ?? [];
    if (_accounts.isNotEmpty) {
      _currentAccount = _accounts[0];
    } else {
      _currentAccount = akun_demo;
    }
  }

  List<Account> get accounts => _accounts;
  Account get currentAccount => _currentAccount;

  int? _selectedIndex;
  Alamat? _alamatSelected;
  
  Alamat? get alamatSelected => _alamatSelected;
  int? get selectedIndex => _selectedIndex;

  get alamatList => _currentAccount.alamat;

  void setAlamat(Alamat alamat, int index) {
    _alamatSelected = alamat;
    _selectedIndex = index;
    notifyListeners();}


  

  void switchAccount(Account newAccount) {
    _currentAccount = newAccount;
    notifyListeners();
  }


  void tambahItem(String gambar, String itemName, int harga, int itemCount, String namatoko) {
    int existingIndex = currentAccount.cart.indexWhere((item) => item.itemName == itemName);
    if (existingIndex != -1) {
      _currentAccount.cart[existingIndex].itemCount += itemCount;
    } else {
      _currentAccount.cart.add(CartItem(gambar:gambar,itemName:itemName, harga:harga, itemCount:itemCount,namatoko: namatoko));
    }
    
    notifyListeners();
  }

  // Fungsi untuk mengurangi jumlah item dalam keranjang belanja
  void kurangiItem(String itemName, int itemCount) {
    int existingIndex = _currentAccount.cart.indexWhere((item) => item.itemName == itemName);
    if (existingIndex != -1) {
      _currentAccount.cart[existingIndex].itemCount -= itemCount;
      if (_currentAccount.cart[existingIndex].itemCount <= 0) {
        _currentAccount.cart.removeAt(existingIndex);
      }
      notifyListeners();
    }
  }

  // Fungsi untuk mendapatkan jumlah item dalam keranjang belanja
  int getItemCount(String itemName) {
    int existingIndex = _currentAccount.cart.indexWhere((item) => item.itemName == itemName);
    return existingIndex != -1 ? _currentAccount.cart[existingIndex].itemCount : 0;
  }

  // Fungsi untuk mendapatkan harga dari suatu jenis item dalam keranjang belanja
  int getPrice(String itemName) {
    int existingIndex = _currentAccount.cart.indexWhere((item) => item.itemName == itemName);
    return existingIndex != -1 ? _currentAccount.cart[existingIndex].harga : 0;
  }

  // Fungsi untuk memilih atau tidak memilih item dalam keranjang belanja
  void toggleItemSelection(CartItem item) {
    item.isSelected = !item.isSelected;
    notifyListeners();
  }

  // Fungsi untuk menghapus item dari keranjang belanja
  void hapusItem(CartItem item) {
    _currentAccount.cart.remove(item);
    notifyListeners();
  }

  void setCurrentAccount(Account akun_demo) {}
}



// Kelas ThemeModeProvider untuk mengelola tema aplikasi
class ThemeModeProvider with ChangeNotifier {
  bool _themeMode = false;

  bool get themeMode => _themeMode;

  // Metode untuk mengubah status tema
  void toggleTheme(bool val) {
    _themeMode = val;
    notifyListeners();
  }
}




class PromoProvider extends ChangeNotifier {
  int? _promoPercentage;
  String? _promoCode;

  int? get promoPercentage => _promoPercentage;
  String? get promoCode => _promoCode;

  // Mengatur persentase promo berdasarkan kode
  void setPromo(String code) {
    if (code == 'PROMO10') {
      _promoPercentage = 10; // Diskon 10%
      _promoCode = code;
    } else if (code == 'PROMO20') {
      _promoPercentage = 20; // Diskon 20%
      _promoCode = code;
    } else if (code == 'ALEX RETRI GACOR') {
      _promoPercentage = 50; // Diskon 20%
      _promoCode = code;
    } else {
      _promoPercentage = null;
      _promoCode = null;
    }
    notifyListeners();
  }
}




class PriorityProvider extends ChangeNotifier {
  bool isPriority = false;

  void setPriority(bool val){
    isPriority = val;
    notifyListeners();
  }
}



class CommentData extends ChangeNotifier {
  List<Map<String, dynamic>> _commentsList = [];

  List<Map<String, dynamic>> get commentsList => _commentsList;

  void addComment(Map<String, dynamic> commentData) {
    _commentsList.insert(0, commentData);
    notifyListeners();
  }
}

