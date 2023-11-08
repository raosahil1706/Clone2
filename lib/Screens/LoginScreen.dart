import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Homescreen.dart';

import '../CustomUI/ButtonCard.dart';
import '../Model/ChatModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatmodels = [
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
      name: "Dazai",
      isGroup: false,
      currentMessage: "Ready for double sucide??",
      time: "23:20",
      icon: "person.svg",
      id: 3,
    ),
    // ChatModel(
    //   name: "Straw Hats",
    //   isGroup: true,
    //   currentMessage: "Yohohohohhoh",
    //   time: "21:20",
    //   icon: "groups.svg",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  sourceChat = chatmodels.removeAt(index);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => Homescreen(
                                chatmodels: chatmodels,
                                sourChat: sourceChat,
                              )));
                },
                child: ButtonCard(
                  name: chatmodels[index].name,
                  icon: Icons.person,
                ),
              )),
    );
  }
}
