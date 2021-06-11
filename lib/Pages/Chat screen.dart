import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/constant.dart';

class ChatScreen extends StatefulWidget {
  final name;
  final dp;

  const ChatScreen({@required this.name, @required this.dp});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List msg = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/whtasapp Wallpaer.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              leading: Row(
                children: [
                  Icon(Icons.arrow_back_rounded),
                  CircleAvatar(
                    // radius: 400,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(widget.dp),
                  ),
                ],
              ),
              titleSpacing: 0,
              title: Text(widget.name),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.videocam_rounded),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.call),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.more_vert),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  // color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5, left: 3),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              width: 250,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  hintText: "Type a message",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.attach_file,
                                          color: Colors.grey,
                                        ),
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
                                        icon: Icon(
                                          Icons.camera_alt,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (builder) =>
                                          //             CameraApp()));
                                        },
                                      ),
                                    ],
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xff128c7e),
                          child: Icon(
                            Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bottomSheet() {}
}
