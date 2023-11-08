// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/CustomUI/OwnFileCard.dart';
import 'package:flutter_app/CustomUI/ReplyCard.dart';
import 'package:flutter_app/CustomUI/ReplyFileCard.dart';
// import 'package:flutter_app/CustomUI/ReplyFileCard.dart';
import 'package:flutter_app/Screens/CameraScreen.dart';
import 'package:flutter_app/Screens/CameraView.dart';
//import 'package:flutter_app/Screens/CameraView.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../CustomUI/OwnMessageCard.dart';
import '../Model/ChatModel.dart';
import '../Model/MessageModel.dart';
import 'package:http/http.dart' as http;

class IndividualPage extends StatefulWidget {
  const IndividualPage(
      {super.key, required this.chatModel, required this.sourChat});
  final ChatModel chatModel;
  final ChatModel sourChat;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  late IO.Socket socket;
  List<MessageModel> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();
  late XFile file;
  int popTime = 0;

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
        setState(() {
          show = false;
        });
      }
    });
  }

  void connect() {
    socket = IO.io("http://192.168.1.12:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
    });
    socket.connect();
    socket.emit("signin", widget.sourChat.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"], msg["path"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId, String path) {
    setMessage("source", message, path);
    socket.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
      "path": path
    });
  }

  void setMessage(String type, String message, String path) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,
        path: path,
        time: DateTime.now().toString().substring(10, 16));
    setState(() {
      setState(() {
        messages.add(messageModel);
      });
    });
  }

  Future<void> onImageSend(String path, String message) async {
    print("hey there its working $path");
    for (int i = 0; i < popTime; i++) {
      Navigator.pop(context);
    }
    setState(() {
      popTime = 0;
    });
    var request = http.MultipartRequest(
        "POST", Uri.parse("http://192.168.1.12:5000/routes/addImage"));
    request.files.add(await http.MultipartFile.fromPath("img", path));
    request.headers.addAll({
      "Content-type": "mutlipart/form-data",
    });
    http.StreamedResponse response = await request.send();
    var httpResponse = await http.Response.fromStream(response);
    var data = json.decode(httpResponse.body);

    print(data['path']);
    setMessage("source", message, path);
    socket.emit("message", {
      "message": message,
      "sourceId": widget.sourChat.id,
      "targetId": widget.chatModel.id,
      "path": data['path'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/back.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                      child: SvgPicture.asset(
                        widget.chatModel.isGroup!
                            ? "assets/groups.svg"
                            : "assets/person.svg",
                        color: Colors.white,
                        height: 37,
                        width: 37,
                      ),
                    )
                  ],
                ),
              ),
              title: InkWell(
                child: Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chatModel.name,
                        style: const TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "last seen today at 10:29",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.videocam),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.call),
                  onPressed: () {},
                ),
                PopupMenuButton<String>(onSelected: (value) {
                  print("value");
                }, itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: "View Contact",
                      child: Text("View Contact"),
                    ),
                    const PopupMenuItem(
                      value: "Media,links, and docs",
                      child: Text("Media,links, and docs"),
                    ),
                    const PopupMenuItem(
                      value: "WhatsApp Web",
                      child: Text("WhatsApp Web"),
                    ),
                    const PopupMenuItem(
                      value: "Search",
                      child: Text("Search"),
                    ),
                    const PopupMenuItem(
                      value: "Mute Notifications",
                      child: Text("Mute Notifications"),
                    ),
                    const PopupMenuItem(
                      value: "Wallpaper",
                      child: Text("Wallpaper"),
                    ),
                  ];
                })
              ],
            ),
          ),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WillPopScope(
                child: Column(
                  children: [
                    Expanded(
                      // height: MediaQuery.of(context).size.height - 140,

                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: messages.length + 1,
                        itemBuilder: (context, index) {
                          if (index == messages.length) {
                            return Container(
                              height: 70,
                            );
                          }
                          if (messages[index].type == "source") {
                            if (messages[index].path.isNotEmpty) {
                              return OwnFileCard(
                                  path: messages[index].path,
                                  message: messages[index].message,
                                  time: messages[index].time);
                            } else {
                              return OwnMessageCard(
                                message: messages[index].message,
                                time: messages[index].time,
                              );
                            }
                          } else {
                            if (messages[index].path.isNotEmpty) {
                              return ReplyFileCard(
                                  path: messages[index].path,
                                  message: messages[index].message,
                                  time: messages[index].time);
                            } else {
                              return ReplyCard(
                                  message: messages[index].message,
                                  time: messages[index].time);
                            }
                          }
                        },
                      ),
                      // child: ListView(
                      //   children: [
                      //     OwnFileCard(),
                      //     ReplyFileCard(),
                      //   ],
                      // ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    child: Card(
                                      margin: const EdgeInsets.only(
                                          left: 2, right: 2, bottom: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: TextFormField(
                                        controller: _controller,
                                        focusNode: focusNode,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        minLines: 1,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            setState(() {
                                              sendButton = true;
                                            });
                                          } else {
                                            setState(() {
                                              sendButton = false;
                                            });
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type a Message",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          prefixIcon: IconButton(
                                              icon: Icon(show
                                                  ? Icons.keyboard
                                                  : Icons
                                                      .emoji_emotions_outlined),
                                              onPressed: () {
                                                if (!show) {
                                                  focusNode.unfocus();
                                                  focusNode.canRequestFocus =
                                                      false;
                                                  setState(() {
                                                    show = !show;
                                                  });
                                                }
                                              }),
                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.attach_file),
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (builder) =>
                                                          bottomSheet());
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.camera_alt),
                                                onPressed: () {
                                                  setState(() {
                                                    popTime = 2;
                                                  });
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (builder) =>
                                                              CameraScreen(
                                                                // onImageSend:
                                                                //     onImageSend,
                                                              )));
                                                },
                                              )
                                            ],
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, right: 2, left: 2),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: const Color(0xFF128C7E),
                                      child: IconButton(
                                        icon: Icon(
                                          sendButton ? Icons.send : Icons.mic,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          if (sendButton) {
                                            _scrollController.animateTo(
                                                _scrollController
                                                    .position.maxScrollExtent,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.easeOut);
                                            sendMessage(
                                                _controller.text,
                                                widget.sourChat.id,
                                                widget.chatModel.id,
                                                "");
                                            _controller.clear();
                                            setState(() {
                                              sendButton = false;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              show ? emojiSelect() : Container(),
                            ],
                          ),
                        )),
                  ],
                ),
                onWillPop: () {
                  if (show) {
                    setState(() {
                      show = false;
                    });
                  } else {
                    Navigator.pop(context);
                  }
                  return Future.value(false);
                },
              )),
        )
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.insert_drive_file, Colors.indigo,
                      "Document", () {}),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera", () {
                    setState(() {
                      popTime = 3;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => CameraScreen(
                                //  onImageSend: onImageSend,
                                )));
                  }),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery",
                      () async {
                    setState(() {
                      popTime = 2;
                    });
                    file =
                        (await _picker.pickImage(source: ImageSource.gallery))!;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => CameraView(
                                  path: file.path,
                                 // onImageSend: onImageSend,
                                )));
                  }),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio", () {}),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                      Icons.location_pin, Colors.teal, "Location", () {}),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact", () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text, onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
        config: const Config(
          columns: 7,
        ),
        onEmojiSelected: (emoji, category) {
          _controller;
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.toString();
          });
        });
  }
}
