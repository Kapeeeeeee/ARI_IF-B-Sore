import 'package:flutter/material.dart';
import 'package:kerkom/chat/lib/chatscreen.dart';
import 'package:kerkom/chat/lib/contoh_prov.dart';
import 'package:kerkom/detail.dart';
import 'package:kerkom/provider.dart';
import 'package:provider/provider.dart';

void showChatDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: WhatsappDialog(),
      );
    },
  );
}

class WhatsappDialog extends StatelessWidget {
  const WhatsappDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Whatsapp();
  }
}

class Whatsapp extends StatelessWidget {
  const Whatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Account currentUser = Provider.of<AccountProvider>(context).currentAccount;
    var chatEntries = Provider.of<ChatProvider>(context)
        .listPercakapan[currentUser.namauser]
        ?.entries
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("${currentUser.namauser}"),
        backgroundColor: Colors.blue,
      ),
      body: chatEntries != null
          ? buildChatList(context, chatEntries)
          : Center(child: Text('Tidak ada percakapan')),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  Widget buildChatList(
      BuildContext context, List<MapEntry<String, List<Map<String, String>>>> chatEntries) {
    return Container(
      child: ListView.builder(
        itemCount: chatEntries.length,
        itemBuilder: (context, index) {
          var chatEntryIndex = chatEntries[index];
          var chatValue = chatEntryIndex.value;
          if (chatValue.isEmpty) {
            return SizedBox();
          }
          var lastMessage = chatValue.last.values.join("");
          return InkWell(
            onLongPress: () => showDeleteDialog(context, chatEntryIndex),
            child: Column(
              children: [
                ListTile(
                  title: Text(chatEntryIndex.key,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color)),
                  subtitle: Text(
                    lastMessage.length > 20
                        ? "${lastMessage.substring(0, 20)}..."
                        : lastMessage,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color),
                  ),
                ),
              ],
            ),
            onTap: () {
              chattingan(context, chatEntryIndex.key);
            },
          );
        },
      ),
    );
  }
}

void showDeleteDialog(
    BuildContext context, MapEntry<String, List<Map<String, String>>> chatEntryIndex) {
  var chatProvider = Provider.of<ChatProvider>(context, listen: false);
  Account currentUser = Provider.of<AccountProvider>(context, listen: false).currentAccount;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Delete Chat from ${chatEntryIndex.key}',
          style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),
        ),
        content: Text(
            'If you delete this chat, you wont be able to recover it. Do you want to delete it?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel',
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1?.color)),
          ),
          TextButton(
            onPressed: () {
              chatProvider.removeChat(currentUser.namauser, chatEntryIndex.key);
              Navigator.of(context).pop();
            },
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        contentTextStyle:
            TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),
      );
    },
  );
}
