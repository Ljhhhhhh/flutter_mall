import 'package:flutter/material.dart';

class UserinfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserinfoWidgetState();
  }
}

class UserinfoWidgetState extends State<UserinfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text('我的资料'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text('我的资料',
                style: TextStyle(
                    fontSize: 15, height: 21 / 15, color: Color(0xFF999999))),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Column(
              children: <Widget>[TextField()],
            ),
          ),
          Container(height: 60),
          Material(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFF3C774), // 渐变背景
              child: MaterialButton(
                child: Text("normal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                onPressed: () {},
                height: 50,
                minWidth: 355,
              ))
        ],
      ),
    );
  }
}
