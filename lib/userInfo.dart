import 'package:flutter/material.dart';

class UserinfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserinfoWidgetState();
  }
}

class UserinfoWidgetState extends State<UserinfoWidget> {
  final _formKey = GlobalKey<FormState>();
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
              // child: Column(
              //   children: <Widget>[TextField()],
              // ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Container(
                    //   decoration: new BoxDecoration(
                    //     border: new Border(
                    //         bottom:
                    //             BorderSide(color: Colors.black54, width: 2.0)),
                    //   ),
                    //   child: TextFormField(
                    //     decoration: const InputDecoration(
                    //         hintText: '请输入手机号码',
                    //         prefixText: '手机号码 ',
                    //         prefixStyle: TextStyle(color: Colors.red)),
                    //     validator: (value) {
                    //       if (value.isEmpty) {
                    //         return '请输入手机号码';
                    //       }
                    //       return null;
                    //     },
                    //   ),
                    // ),
                    // https://github.com/fluttercandies/wechat_flutter/blob/master/lib/ui/view/edit_view.dart
                    TextFormField(
                      decoration: new InputDecoration(
                        prefixIcon: Container(
                          alignment: Alignment.centerLeft,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          child: Text('手机号码 ', style: TextStyle(fontSize: 16, height: 1),)
                        ),
                    ),),
                    TextFormField(
                      decoration: new InputDecoration(
                        prefix: Text('姓名 '),
                        focusColor: Colors.red
                    ),),
                    
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //     hintText: '请输入姓名',
                    //     prefixText: '姓名 ',
                    //   ),
                    //   validator: (value) {
                    //     if (value.isEmpty) {
                    //       return '请输入姓名';
                    //     }
                    //     return null;
                    //   },
                    // )
                  ],
                ),
              )),
          Container(height: 60),
          Material(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFF3C774), // 渐变背景
              child: MaterialButton(
                child: Text("确认",
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
