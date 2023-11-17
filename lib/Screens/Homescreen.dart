import 'package:flutter/material.dart';
import 'package:flutter_app/Model/ChatModel.dart';
import 'package:flutter_app/NewScreen/CallScreen.dart';
import 'package:flutter_app/Pages/CameraPage.dart';
import 'package:flutter_app/Pages/StatusPage.dart';

import '../Pages/ChatPage.dart';

class Homescreen extends StatefulWidget {
  // Homescreen({Key key}): super(key: key);
  Homescreen({super.key, required this.chatmodels,required this.sourChat});
  final List<ChatModel>? chatmodels;
  final ChatModel? sourChat;

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatApp"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(onSelected: (value) {
            print("value");
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("New Group"),
                value: "New Group",
              ),
              PopupMenuItem(
                child: Text("New BroadCast"),
                value: "New Broadcast",
              ),
              PopupMenuItem(
                child: Text("WhatsApp Web"),
                value: "WhatsApp Web",
              ),
              PopupMenuItem(
                child: Text("Starred Message"),
                value: "Starred Message",
              ),
              PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              ),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(
            chatmodels: widget.chatmodels!,
            sourChat: widget.sourChat!,
          ),
          StatusPage(),
          CallScreen(),
        ],
      ),
    );
  }
}
