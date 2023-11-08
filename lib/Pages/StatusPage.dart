import 'package:flutter/material.dart';
import 'package:flutter_app/CustomUI/Status/HeadOwnStatus.dart';
import 'package:flutter_app/CustomUI/Status/OtherStatus.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              elevation: 8,
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: Icon(Icons.camera_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // SizedBox(height: 10,),
          HeadOwnStatus(),
          label("Recent Updates"),
          OtherStatus(
            name: "Itachi",
            imageName: "assets/2.jpg",
            time: "09:11",
            isSeen: false,
            statusNum: 1,
          ),
          OtherStatus(
            name: "Madara",
            imageName: "assets/3.png",
            time: "09:32",
            isSeen: false,
            statusNum: 2,
          ),
          OtherStatus(
            name: "Sishui",
            imageName: "assets/4.jpg",
            time: "12:59",
            isSeen:false,
            statusNum: 4,
          ),
          SizedBox(
            height: 10,
          ),
          label("Viewed Updates"),
          OtherStatus(
            name: "Itachi",
            imageName: "assets/2.jpg",
            time: "09:11",
            isSeen: true,
            statusNum: 1,
          ),
          OtherStatus(
            name: "Madara",
            imageName: "assets/3.png",
            time: "09:32",
            isSeen: true,
            statusNum: 2,
          ),
          OtherStatus(
            name: "Sishui",
            imageName: "assets/4.jpg",
            time: "12:59",
            isSeen: true,
            statusNum: 4,
          ),
        ]),
      ),
    );
  }

  Widget label(String labelName) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          labelName,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
