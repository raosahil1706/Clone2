import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../Model/ChatModel.dart';
import '../Screens/IndividualPage.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({  Key? key, required this.chatModel,required this.sourChat }): super(key:key);
  final ChatModel chatModel;
  final ChatModel sourChat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context, MaterialPageRoute(builder:(context)=>IndividualPage(
            chatModel: chatModel,
            sourChat: sourChat,
          ))
        );
      },
      child: Column(
        children: [
            ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blueGrey,
          child: SvgPicture.asset(
            chatModel.isGroup! ?"assets/groups.svg":"assets/person.svg",
            color:Colors.white,
            height:37,width:37,
          ),
        ),
        title:  Text(chatModel.name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),
        subtitle: Row(
          children: [
            Icon(Icons.done_all),
            SizedBox(),
            Text(chatModel.currentMessage!,
            style: TextStyle(
              fontSize: 13,
            ),
            ),
          ],
        ),
        trailing: Text(chatModel.time!),
      ),
      Padding(
      padding: const EdgeInsets.only(right: 20,left: 80),
      child: Divider(
        thickness: 1,
      ),
    )
        ],
      ),
    );
    
    
    
  }
}

