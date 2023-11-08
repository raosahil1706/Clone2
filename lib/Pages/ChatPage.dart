import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/SelectContact.dart';

import '../CustomUI/CustomCard.dart';
import '../Model/ChatModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.chatmodels, required this.sourChat});
  final List<ChatModel> chatmodels;
  final ChatModel sourChat;
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Sachin",
      isGroup: false,
      currentMessage: "Hi i m batman",
      time: "21:20",
      icon: "person.svg",
      id: 1,
    ),
    ChatModel(
      name: "Beeta",
      isGroup: false,
      currentMessage: "Welcome to beeta",
      time: "22:46",
      icon: "person.svg",
      id: 2,
    ),
    ChatModel(
      name: "JL",
      isGroup: true,
      currentMessage: "Justice League",
      time: "21:20",
      icon: "groups.svg",
      id: 0,
    ),
    ChatModel(
      name: "Dazai",
      isGroup: false,
      currentMessage: "Ready for double sucide??",
      time: "23:20",
      icon: "person.svg",
      id: 3,
    ),
    ChatModel(
      name: "Straw Hats",
      isGroup: true,
      currentMessage: "Yohohohohhoh",
      time: "21:20",
      icon: "groups.svg",
      id: 0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
          itemCount: widget.chatmodels.length,
          itemBuilder: (contex, index) => CustomCard(
                chatModel: widget.chatmodels[index],
                sourChat: widget.sourChat,
              )),
    );
  }
}
