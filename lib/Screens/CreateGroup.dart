import 'package:flutter/material.dart';
import 'package:flutter_app/CustomUI/AvatarCard.dart';
import 'package:flutter_app/CustomUI/ContactCard.dart';
import '../Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "Naruto", status: "will become hokage", select: false,id: 1),
    ChatModel(name: "Dazai", status: "want to double sucide", select: false,id: 2),
    ChatModel(name: "Eren", status: "want freedom", select: false,id: 3),
    ChatModel(
        name: "Denji", status: "want to touch some boobs", select: false,id: 4),
  ];
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add participants",
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
        ],
      ),
      body: Stack(children: [
        ListView.builder(
          itemCount: contacts.length+1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                height: groups.length > 0 ? 90 : 10,
              );
            }
            return InkWell(
                onTap: () {
                  setState(() { 
                  if (contacts[index-1].select == true) {
                    groups.remove(contacts[index-1]);
                    contacts[index-1].select = false;
                  } else {
                      groups.add(contacts[index-1]);
                      contacts[index-1].select = true; 
                  }});                
                },
                child: ContactCard(
                  contact: contacts[index-1],
                ));
          },
        ),
        groups.length > 0
            ? Column(
                children: [
                  Container(
                    height: 75,
                    color: Colors.white,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          if (contacts[index].select == true) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  contacts[index].select = false;
                                  groups.remove(contacts[index]);
                                });
                              },
                              child: AvatarCard(contact: contacts[index]),
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                ],
              )
            : Container(),
      ]),
    );
  }
}
