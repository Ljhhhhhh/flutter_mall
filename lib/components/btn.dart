import 'package:flutter/material.dart';

class UserBtn extends FlatButton {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("查看更多", textAlign: TextAlign.right),
          Icon(
            Icons.keyboard_arrow_right,
            color: Color(0xFF333333),
            size: 24,
          ),
        ],
      ),
      textColor: Color(0xFF333333),
      onPressed: () {
        Navigator.pushNamed(context, '/Product');
      },
    );
  }
}
