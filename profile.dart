import 'package:flutter/material.dart';
import 'package:kerkom/project/home.dart';
import 'package:kerkom/project/detail.dart';
import 'package:provider/provider.dart';
import 'package:kerkom/project/provider.dart'; // Make sure to replace this with the correct location of the AccountProvider file
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
    // Accessing the provider to get the current user data
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
                      _showEditProfileDialog(context, (updatedAccount) {
                        setState(() {
                          // Update the profile with the new values
                          p1 = updatedAccount;
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
      BuildContext context, Function(Account) onUpdate) {
    // Controllers for handling user input
    TextEditingController pictureController =
        TextEditingController(text: p1.foto);
    TextEditingController nameController =
        TextEditingController(text: p1.namauser);
    TextEditingController descriptionController =
        TextEditingController(text: p1.deskripsi);
    TextEditingController phoneController =
        TextEditingController(text: p1.nohp);

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
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Get new values from text controllers
                String newPicture = pictureController.text;
                String newName = nameController.text;
                String newDescription = descriptionController.text;
                String newPhone = phoneController.text;

                // Update the account information
                p1.updateAccount(
                  foto: newPicture,
                  namauser: newName,
                  deskripsi: newDescription,
                  nohp: newPhone,
                );

                // Close the dialog
                Navigator.of(context).pop();

                // Call the callback function to update UI with new values
                onUpdate(p1);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
