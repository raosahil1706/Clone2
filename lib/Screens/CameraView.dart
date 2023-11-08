import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key? key, required this.path, 
  //required this.onImageSend
  }):super(key: key);
  final String path;
  //final Function onImageSend;
  static TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.crop,
              size: 27,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.emoji_emotions,
              size: 27,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.title,
              size: 27,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              size: 27,
            )),
      ]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: _controller,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add caption",
                      prefixIcon: const Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 27,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          // onImageSend(
                          //   path,
                          //   _controller.text.trim(),
                          // );
                        },
                        child: const CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.tealAccent,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
