import 'package:flutter/material.dart';

class UserWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserWidgetState();
}

class UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    // showModalBottomSheet()
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.blue,
      // constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        overflow: Overflow.visible,
        children: <Widget>[
          // Container(
          //   child: Text("Hello world", style: TextStyle(color: Colors.white)),
          //   color: Colors.red,
          // ),
          Positioned(
            left: 28.0,
            top: 188,
            child: Text("I am Jack"),
          ),
          Positioned(
            top: 58.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
