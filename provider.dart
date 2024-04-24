import 'package:flutter/material.dart';

class CartItem {
  final String gambar;
  final String itemName;
  final int harga;
  int itemCount;
  final String namatoko;
  bool isSelected;


  CartItem({
    required this.gambar,
    required this.itemName,
    required this.harga,
    required this.itemCount,
    required this.namatoko,

    this.isSelected = false, // Inisialisasi isSelected dengan false
  });
}

class Alamat{
  final String nama;
  final String detail;
  final double ongkir;
  final String nohp;

  Alamat(this.nama, this.detail, this.ongkir, this.nohp);
  }


class CartProvider extends ChangeNotifier {
  List<CartItem> items = [];

  // Fungsi untuk menambah item ke dalam keranjang berdasarkan nama item, harga, dan jumlah
  void tambahItem(String gambar,String itemName, int harga, int itemCount,String namatoko) {
    int existingIndex = items.indexWhere((item) => item.itemName == itemName);
    if (existingIndex != -1) {
      items[existingIndex].itemCount += itemCount;
    } else {
      items.add(CartItem(gambar:gambar,itemName:itemName, harga:harga, itemCount:itemCount,namatoko: namatoko));
    }
    notifyListeners();
  }
  // Fungsi untuk mengurangi item dari keranjang berdasarkan nama item dan jumlah
  void kurangiItem(String itemName, int itemCount) {
    int existingIndex = items.indexWhere((item) => item.itemName == itemName);
    if (existingIndex != -1) {
      items[existingIndex].itemCount -= itemCount;
      if (items[existingIndex].itemCount <= 0) {
        items.removeAt(existingIndex);
      }
      notifyListeners();
    }
  }
  // Fungsi untuk mendapatkan jumlah item dari suatu jenis
  int getItemCount(String itemName) {
    int existingIndex = items.indexWhere((item) => item.itemName == itemName);
    return existingIndex != -1 ? items[existingIndex].itemCount : 0;
  }

  // Fungsi untuk mendapatkan harga dari suatu jenis item
  int getPrice(String itemName) {
    int existingIndex = items.indexWhere((item) => item.itemName == itemName);
    return existingIndex != -1 ? items[existingIndex].harga : 0;
  }

void toggleItemSelection(CartItem item) {
    item.isSelected = !item.isSelected;
    notifyListeners();
  }
void hapusItem(CartItem item) {
    items.remove(item);
    notifyListeners();
  }
  
}

class AlamatProvider extends ChangeNotifier{
  int? _selectedIndex;
  Alamat? _alamatSelected;

  Alamat? get alamatSelected => _alamatSelected;
  int? get selectedIndex => _selectedIndex;

  get alamatList => [
  Alamat("Rumah Alex", "Jl. Retribution No. 1, Kota Indomaret", 15000.0, "082355694151"),
  Alamat("Kantor Frederick", "Jl. Tembak No. 2, Kota Gamon", 20000.0, "081225648792"),
  Alamat("Gudang Richardo", "Jl. Polisi No. 3, Kota Tidur", 25000.0, "085845654864"),
  Alamat("Gudang Kenzie", "Jl. Dark System No. 5, Kota Apaaja", 15000.0, "085235478468"),
  ];

  void setAlamat(Alamat alamat, int index) {
    _alamatSelected = alamat;
    _selectedIndex = index;
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