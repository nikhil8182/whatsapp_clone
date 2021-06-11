import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:whatsapp_clone/Pages/Camera.dart';
import 'package:whatsapp_clone/Pages/Chat.dart';
import 'package:whatsapp_clone/Pages/Status.dart';
import 'package:image_picker/image_picker.dart';

import 'Calls.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    tabController = new TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Onwords Whatsapp",
            style: GoogleFonts.openSans(),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text("New Group"),
                        value: "New Group",
                      ),
                      PopupMenuItem(
                        child: Text("New Broadcast"),
                        value: "New Broadcast",
                      ),
                      PopupMenuItem(
                        child: Text("Whatsapp Web"),
                        value: "Whatsapp Web",
                      ),
                      PopupMenuItem(
                        child: Text("Starred Message"),
                        value: "item1",
                      ),
                      PopupMenuItem(
                        child: Text("Settings"),
                        value: "Settings",
                      ),
                    ];
                  },
                ),
              ],
            ),
          ],
          bottom: TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt_rounded),
              ),
              Tab(
                text: "Chat",
              ),
              Tab(
                text: "Status",
              ),
              Tab(
                text: "Call",
              )
            ],
          ),
        ),
        body: new TabBarView(
          controller: tabController,
          children: <Widget>[
            new Camera(),
            new Chat(),
            new Status(),
            new Calls(),
          ],
        ),
        floatingActionButton: tabController.index == 0
            ? FloatingActionButton(
                onPressed: () {
                  getImage();
                },
                child: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              )
            : tabController.index == 1
                ? FloatingActionButton(
                    onPressed: () async {
                      // await FlutterContactPicker.requestPermission();
                      // await FlutterContactPicker.pickPhoneContact();
                    },
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                  )
                : tabController.index == 2
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 45.0,
                            width: 45.0,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: getImage,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    : FloatingActionButton(
                        child: Icon(
                          Icons.add_call,
                          color: Colors.white,
                        ),
                      ));
  }
}
