import 'package:flutter/material.dart';
import 'package:kerkom/chat/lib/contoh_prov.dart';
import 'package:provider/provider.dart';

class disappearMSG extends StatelessWidget {
  const disappearMSG({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    var groupVal = Provider.of<DisappearProvider>(context).groupVal;
    var darkMode = Provider.of<DarkProvider>(context).isDark;
    var colorTernary = darkMode ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text("Disappearing Messages"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: "profile",
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue,
                  child: Icon(
                      Icons.timelapse,
                      color: Colors.white,
                      size: 70
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Make messages in the chat disappear",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorTernary
                      ),
                    ),
                  SizedBox(height: 10),
                  Text(
                      "For more privacy and storage, new messages will disappear from this chat for everyone after the selected duration except when kept. Anyone in the chat can change this setting",
                  style: TextStyle(color: colorTernary),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text("Message timer",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorTernary
                ),
              ),
              SizedBox(height: 10),
              RadioListTile(
                value: 0,
                groupValue: groupVal,
                onChanged: (value){
                  Provider.of<DisappearProvider>(context, listen: false).changeVal(value!);
                },
                title: Text("24 hours", style: TextStyle(color: colorTernary)),
              ),
              RadioListTile(
                value: 1,
                groupValue: groupVal,
                onChanged: (value){
                  Provider.of<DisappearProvider>(context, listen: false).changeVal(value!);
                },
                title: Text("7 days", style: TextStyle(color: colorTernary)),
              ),
              RadioListTile(
                value: 2,
                groupValue: groupVal,
                onChanged: (value){
                  Provider.of<DisappearProvider>(context, listen: false).changeVal(value!);
                },
                title: Text("90 days", style: TextStyle(color: colorTernary)),
              ),
              RadioListTile(
                value: 3,
                groupValue: groupVal,
                onChanged: (value){
                  Provider.of<DisappearProvider>(context, listen: false).changeVal(value!);
                },
                title: Text("Off", style: TextStyle(color: colorTernary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
