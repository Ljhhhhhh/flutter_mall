import 'package:flutter/material.dart';
import 'package:flutter_mall/components/icon.dart';

class UserCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserCenterWidget();
  }
}

class UserCenterWidget extends State<UserCenter> {
  @override

  Widget statusWidget() {
    
    return Column(
              children: <Widget>[
                Icon(Iconfont.status1, color: Color(0xFF666666)),
                Container(height: 6,),
                Text('待确认', style: TextStyle(
                  fontSize: 12,
                  height: 16.5 / 12,
                  color: Color(0xFF666666)
                ),)
              ],
            );
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('我的')),
        body: Container(
          color: Color(0xffF3F4F6),
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
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
                            Image.asset('images/gender2.png',
                                width: 45, height: 45),
                            Container(width: 12.5),
                            Text(
                              '卢洁辉',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  height: 21 / 15),
                            )
                          ],
                        ),
                        Divider(
                          height: 10.0,
                          indent: 0.0,
                          color: Colors.white,
                        ),
                        Container(height: 12),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('剩余可用积分：',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                              Text('12000',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white))
                            ]),
                        Container(height: 6),
                        Row(
                          children: <Widget>[
                            Text('注:积分会在每年的1月1日进行清空，请及时使用',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    top: 156.5,
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      child: Container(
                        height: 125,
                        width: 355,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text('我的订单',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF333333),
                                                fontWeight: FontWeight.bold,
                                                height: 21 / 15)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text('查看全部订单',
                                                style: TextStyle(
                                                    color: Color(0xFF999999),
                                                    fontSize: 13)),
                                            // Container(width: 2),
                                            Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Color(0xFF999999),
                                              size: 24,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Divider(
                                      height: 24.0,
                                      indent: 0.0,
                                      color: Color(0xFFE6E6E6),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        statusWidget(),
                                        statusWidget(),
                                        statusWidget(),
                                        statusWidget(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
