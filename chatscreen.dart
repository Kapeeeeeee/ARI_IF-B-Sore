import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kerkom/project/detail.dart';
import 'package:kerkom/project/provider.dart';
import 'package:provider/provider.dart';
import 'contoh_prov.dart';
import 'disappearMSG.dart';

void chattingan(BuildContext context, String receiver) {
  Account currentUser = Provider.of<AccountProvider>(context, listen: false).currentAccount;
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ChatScreen(receiver: receiver, currentUser: currentUser),
      );
    },
  );
}

class ChatScreen extends StatefulWidget {
  final String receiver;
  final Account currentUser;

  ChatScreen({required this.receiver, required this.currentUser});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var chats = Provider.of<ChatProvider>(context)
        .listPercakapan[widget.currentUser.namauser]?[widget.receiver];
    var fontSize = Provider.of<FontSizeProvider>(context).fontSize;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiver),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => disappearMSG()),
                );
              },
              child: Icon(
                Icons.timelapse,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: chats?.map((chat) {
                          _scrollToBottom();
                          final dateTime = DateTime.now();
                          final formattedDateTime =
                              DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
                          return Container(
                            constraints: BoxConstraints(minHeight: 50),
                            child: Row(
                              mainAxisAlignment:
                                  chat.keys.join("") == widget.currentUser.namauser
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      chat.keys.join("") == widget.currentUser.namauser
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                  children: [
                                    Visibility(
                                      child: Text(chat.keys.join("")),
                                      visible: chat.keys.join("") ==
                                              widget.currentUser.namauser
                                          ? false
                                          : true,
                                    ),
                                    SizedBox(height: 2),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(15)),
                                        color: chat.keys.join("") ==
                                                widget.currentUser.namauser
                                            ? Provider.of<ThemeModeProvider>(context)
                                                    .themeMode
                                                ? Colors.indigo[
                                                    900] // Warna untuk pesan pengirim di mode gelap
                                                : Colors
                                                    .blue // Warna untuk pesan pengirim di mode terang
                                            : Provider.of<ThemeModeProvider>(context)
                                                    .themeMode
                                                ? Colors.grey[
                                                    800] // Warna untuk pesan penerima di mode gelap
                                                : const Color.fromARGB(
                                                    255,
                                                    218,
                                                    213,
                                                    213), // Warna untuk pesan penerima di mode terang
                                      ),
                                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            chat.values.join(""),
                                            style: TextStyle(
                                              fontSize: fontSize,
                                            ),
                                          ),
                                          Text(
                                              formattedDateTime, // Menampilkan tanggal dan waktu
                                              style: TextStyle(
                                                fontSize: 10,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList() ??
                        [],
                  ),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2.1,
                    child: TextField(
                      controller: chatController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).textTheme.bodyText1?.color ??
                                    Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).textTheme.bodyText1?.color ??
                                    Colors.black)),
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (value) {
                        _scrollToBottom();
                        if (value.isNotEmpty) {
                          Provider.of<ChatProvider>(context, listen: false).addChat(
                            widget.currentUser.namauser,
                            widget.receiver,
                            {widget.currentUser.namauser: value},
                          );
                          chatController.clear();
                          _scrollToBottom();
                          _focusNode.requestFocus();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Tidak bisa mengirim pesan kosong'),
                          ));
                        }
                      },
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                          fontSize: fontSize),
                    ),
                  ),
                  // SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (chatController.text.isNotEmpty) {
                        Provider.of<ChatProvider>(context, listen: false).addChat(
                          widget.currentUser.namauser,
                          widget.receiver,
                          {widget.currentUser.namauser: chatController.text},
                        );
                        chatController.clear();
                        _scrollToBottom();
                        _focusNode.requestFocus();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Tidak bisa mengirim pesan kosong'),
                        ));
                      }
                    },
                    child: Icon(Icons.send),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      // padding: EdgeInsets.all(8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
