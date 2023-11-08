import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../Model/ChatModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key,required this.contact});
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children:[ CircleAvatar(
            radius: 23,backgroundColor: Colors.blueGrey[200],
            child: SvgPicture.asset(
              "assets/person.svg",
              color: Colors.white,
              height: 30,
              width: 30,
            ),
          ),
          contact.select! ? const Positioned(
            right: 5,
            bottom: 4,
            child: CircleAvatar(
              backgroundColor: Colors.teal,
              radius: 11,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 18,
              ),
            )):Container(),
          ]
        ),
      ),
      title: Text(
        contact.name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle:Text(
        contact.status!,
        style:const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
