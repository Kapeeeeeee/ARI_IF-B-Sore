import 'package:flutter/material.dart';
import 'package:kerkom/detail.dart';
import 'package:kerkom/provider.dart';
import 'package:provider/provider.dart';

class PurchaseHistory {
  final String date;
  final int totalCost;
  final List<CartItem>? selectedItems;

  PurchaseHistory({
    required this.date,
    required this.totalCost,
    this.selectedItems,
  });
}

class PurchaseHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pembelian'),
      ),
      body: ListView.builder(
        itemCount: currentUser.history.length,
        itemBuilder: (context, index) {
          final purchase = currentUser.history[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) => SelectedItemsBottomSheet(
                    selectedItems: purchase.selectedItems,
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 90,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(purchase.date),
                      Text('Total: ${purchase.totalCost}'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SelectedItemsBottomSheet extends StatelessWidget {
  final List<CartItem>? selectedItems;

  SelectedItemsBottomSheet({this.selectedItems});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    child: Container(
      color:  Theme.of(context).cardColor,
      height: MediaQuery.of(context).size.height * 0.93,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 5,
              color:  Theme.of(context).brightness == Brightness.dark
                          ? const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2)
                          : const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: selectedItems?.length ?? 0,
              itemBuilder: (context, index) {
                final item = selectedItems?[index];
                return item != null
                    ? ListTile(
                        title: Text(item.itemName),
                        subtitle: Text('Harga: ${item.harga}, Jumlah: ${item.itemCount}'),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(item.gambar),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    ),
  );
  }
}
