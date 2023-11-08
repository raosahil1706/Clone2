import 'package:flutter/material.dart';
import 'package:flutter_app/CustomUI/ContactCard.dart';
import 'package:flutter_app/Screens/CreateGroup.dart';
import '../Model/ChatModel.dart';
import '../CustomUI/ButtonCard.dart';
class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> contacts = [
    ChatModel(name: "Naruto",status: "will become hokage",select: false,id: 1),
    ChatModel(name: "Dazai",status: "want to double sucide",select: false,id: 2),
    ChatModel(name: "Eren",status: "want freedom",select: false,id: 3),
    ChatModel(name: "Denji",status: "want to touch some boobs",select: false,id: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SelectContact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "257contacts",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton<String>(onSelected: (value) {
            print("value");
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "Invite a Friend",
                child: Text("Invite a Friend"),
              ),
              const PopupMenuItem(
                value: "Contacts",
                child: Text("Contacts"),
              ),
              const PopupMenuItem(
                value: "Refresh",
                child: Text("Refresh"),
              ),
              const PopupMenuItem(
                value: "Help",
                child: Text("Help"),
              ),
            ];
          })
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap:(){ Navigator.push(
          context, MaterialPageRoute(builder:(builder)=>CreateGroup()),
              );
            },
              child: const ButtonCard(
                icon: Icons.group,
                name: "New Group",
              ),
            );
          } else if (index == 1) {
            return const ButtonCard(
              icon: Icons.person_add,
              name: "New Contact ",
            );
          } 
           return ContactCard(contact: contacts[index - 2]);
          
        },
      ),
    );
  }
}
