import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Models/Call%20Models.dart';

class Calls extends StatefulWidget {
  const Calls({Key key}) : super(key: key);

  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: callData.length,
        itemBuilder: (context, i) => new Column(
              children: <Widget>[
                new Divider(height: 0.1),
                new ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(callData[i].pic),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(callData[i].name,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          )),
                      new Icon(
                        i % 2 == 0 ? Icons.call : Icons.videocam,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    callData[i].time,
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                )
              ],
            ));
  }
}
