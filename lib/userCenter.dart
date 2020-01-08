import 'package:flutter/material.dart';

class UserCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserCenterWidger();
  }
}

class UserCenterWidger extends State<UserCenter> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('我的')),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(27.5, 28, 27.5, 28),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/home-banner.png"),
                    fit: BoxFit.cover)),
            width: MediaQuery.of(context).size.width,
            height: 220,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset('images/gender2.png', width: 45, height: 45),
                    Container(width: 12.5),
                    Text(
                      '卢洁辉',
                      style: TextStyle(
                          fontSize: 15, color: Colors.white, height: 21 / 15),
                    )
                  ],
                ),
                Divider(
                  height: 10.0,
                  indent: 0.0,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
