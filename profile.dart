// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kerkom/home.dart';
import 'package:kerkom/detail.dart';
import 'package:provider/provider.dart';
import 'package:kerkom/provider.dart';
import 'manageAccount.dart';
import 'promo.dart';
import 'changeLanguague.dart';
import 'notifications.dart';
import 'accountSafety.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(currentUser.foto),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showEditProfileDialog(context, currentUser, (updatedAccount) {
                        setState(() {
                          currentUser = updatedAccount;
                        });
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentUser.namauser,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    currentUser.deskripsi,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    currentUser.nohp,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Uang: ${currentUser.uang}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                   Text(
  'Alamat:',
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
),
...currentUser.alamat.map((alamat) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Nama: ${alamat.nama}',
      style: TextStyle(fontSize: 16),
    ),
    Text(
      'Detail: ${alamat.detail}',
      style: TextStyle(fontSize: 16),
    ),
    
  ],
)).toList(),
                  SizedBox(height: 5),
                  
                ],
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => PromoPage()));
              },
              child: ListTile(
                title: Text('Promo'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
              child: ListTile(
                title: Text('Notifications'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LanguageChangePage()));
              },
              child: ListTile(
                title: Text('Change Language'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ManageAcc()));
              },
              child: ListTile(
                title: Text('Manage Account'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AccountSafetyPage()));
              },
              child: ListTile(
                title: Text('Account Safety'),
              ),
            ),
            SwitchListTile(
                title: Text("Dark Mode"),
                value: Provider.of<ThemeModeProvider>(context).themeMode,
                onChanged: (val) {
                  setState(() {
                    Provider.of<ThemeModeProvider>(context, listen: false)
                        .toggleTheme(val);
                  });
                }),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0), // Adjust the horizontal padding as needed
              child: Divider(
                color: Colors.grey, // Color of the line
                thickness: 1, // Thickness of the line
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: ListTile(
                title: Text('Privacy Policy'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: ListTile(
                title: Text('Help Center'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: ListTile(
                title: Text('Term of Service'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: ListTile(
                title: Text('Rate Our App'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditProfileDialog(
    BuildContext context, Account currentUser, Function(Account) onUpdate) {
  TextEditingController nameController =
      TextEditingController(text: currentUser.namauser);
  TextEditingController descriptionController =
      TextEditingController(text: currentUser.deskripsi);
  TextEditingController phoneController =
      TextEditingController(text: currentUser.nohp);
  TextEditingController pictureController =
      TextEditingController(text: currentUser.foto);
  
List<TextEditingController> addressNameControllers = currentUser.alamat
      .map((alamat) => TextEditingController(text: alamat.nama))
      .toList();
  List<TextEditingController> addressDetailControllers = currentUser.alamat
      .map((alamat) => TextEditingController(text: alamat.detail))
      .toList();
  List<TextEditingController> addressOngkirControllers = currentUser.alamat
      .map((alamat) => TextEditingController(text: alamat.ongkir.toString()))
      .toList();
  List<TextEditingController> addressPhoneControllers = currentUser.alamat
      .map((alamat) => TextEditingController(text: alamat.nohp))
      .toList();


  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit Profile'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: pictureController,
                decoration: InputDecoration(labelText: 'Profile Picture'),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              SizedBox(height: 10,),
               for (int i = 0; i < currentUser.alamat.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Alamat ${i + 1}'),
                    TextField(
                      controller: addressNameControllers[i],
                      decoration: InputDecoration(labelText: 'Nama'),
                    ),
                    TextField(
                      controller: addressDetailControllers[i],
                      decoration: InputDecoration(labelText: 'Detail'),
                    ),
                    
                    TextField(
                      controller: addressPhoneControllers[i],
                      decoration: InputDecoration(labelText: 'No. HP'),
                    ),
                  ],
                ),
              
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              String newPicture = pictureController.text;
              String newName = nameController.text;
              String newDescription = descriptionController.text;
              String newPhone = phoneController.text;
             
              List<Alamat> newAddress = [];
              for (int i = 0; i < currentUser.alamat.length; i++) {
                newAddress.add(Alamat(
                  
                  addressNameControllers[i].text,
                  addressDetailControllers[i].text,
                  double.parse(addressOngkirControllers[i].text),
                  addressPhoneControllers[i].text,
                ));
              }
              

              Account updatedAccount = Account(
                foto: newPicture,
                namauser: newName,
                deskripsi: newDescription,
                nohp: newPhone,
                uang: currentUser.uang,
                alamat: newAddress,
                cart: currentUser.cart,
              );

              Navigator.of(context).pop();
              onUpdate(updatedAccount);
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}

}
