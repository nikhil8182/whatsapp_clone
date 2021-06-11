import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Models/Chat_Model.dart';
import 'Chat screen.dart';
import 'package:whatsapp_clone/Pages/Chat screen.dart';

class Chat extends StatefulWidget {
  const Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: chatsData.length,
      itemBuilder: (context, i) => Column(
        children: [
          Divider(
            height: 0.5,
          ),
          ListTile(
            onTap: () {
              print("${chatsData[i].name} is pressed");
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ChatScreen(
                    name: chatsData[i].name,
                    dp: chatsData[i].pic,
                  );
                },
              ));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(chatsData[i].pic),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chatsData[i].name,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  chatsData[i].time,
                  style: TextStyle(fontSize: 11.0, color: Colors.grey),
                ),
              ],
            ),
            subtitle: Text(chatsData[i].msg),
          )
        ],
      ),
    ));
  }
}
