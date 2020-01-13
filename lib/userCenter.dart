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
  // Widget stateWidget;
  
  // Widget StateWidgetBuild() {
  //   final statusMap = [
  //   StatusItem('待确认', 'status1'),
  //   StatusItem('待发货', 'status2'),
  //   StatusItem('待收货', 'status3'),
  //   StatusItem('已取消', 'status4'),
  // ];
  // Widget content;
  // for (var item in statusMap) {
  //   content
  // }
  // }

  

  // Widget statusWidget() {
  //   // https://juejin.im/post/5b4db4a06fb9a04f9e23073e
  //   return Column(
  //             children: <Widget>[
  //               Icon(Iconfont.status1, color: Color(0xFF666666)),
  //               Container(height: 6,),
  //               Text('待确认', style: TextStyle(
  //                 fontSize: 12,
  //                 height: 16.5 / 12,
  //                 color: Color(0xFF666666)
  //               ),)
  //             ],
  //           );
  // }
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        StatusWidget('待确认', 'status1'),
                                        StatusWidget('待发货', 'status2'),
                                        StatusWidget('待收货', 'status3'),
                                        StatusWidget('已取消', 'status4'),
                                      ],
                                      // children: [],
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
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0,68.5, 0, 10),
                  // width: 375,
                  height: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/my-store.png',
                        width: MediaQuery.of(context).size.width - 20,
                        height: 125,
                        // fit: BoxFit.cover
                      )
                    ],
                  )),
                  Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('常用服务', style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 15,
                              height: 21 / 15,
                              fontWeight: FontWeight.bold
                            )),
                            Container(height: 14.5),
                            Divider(
                              color: Color(0xFFE6E6E6),
                            ),
                            Container(height: 14.5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                MenuWidget('我的收藏','images/user-menu1.png'),
                                MenuWidget('收货地址','images/user-menu2.png'),
                                MenuWidget('我的资料','images/user-menu3.png'),
                                MenuWidget('联系商家','images/user-menu4.png'),
                              ],
                            )
                          ],
                        ),
                        )
                    ),
                  )
            ],
          ),
        ));
  }
}

class StatusItem {
  final String status;
  final String statusIcon;
  StatusItem(this.status, this.statusIcon);
}

class StatusWidget extends StatelessWidget {
  final String status;
  final String statusIcon;

  getIcon(String icon) {
    switch (icon) {
      case 'status1':
        return Iconfont.status1;
        break;
      case 'status2':
        return Iconfont.status2;
        break;
      case 'status3':
        return Iconfont.status3;
        break;
      case 'status4':
        return Iconfont.status4;
        break;
      default:
    }
  }

  //数据可以通过构造方法传递进来
  StatusWidget(this.status, this.statusIcon);

  @override
  Widget build(BuildContext context) {
    //这里返回你需要的控件
    //这里末尾有没有的逗号，对于格式化代码而已是不一样的。
    return Column(
      children: <Widget>[
        Icon(getIcon(statusIcon), color: Color(0xFF666666)),
        Container(
          height: 6,
        ),
        Text(
          status,
          style: TextStyle(
              fontSize: 12, height: 16.5 / 12, color: Color(0xFF666666)),
        )
      ],
    );
  }
}

class MenuWidget extends StatelessWidget {
  final String status;
  final String statusIcon;

  //数据可以通过构造方法传递进来
  MenuWidget(this.status, this.statusIcon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
      children: <Widget>[
        // Icon(getIcon(statusIcon), color: Color(0xFF666666)),
        Image.asset(statusIcon, height: 35, width: 35),
        Container(
          height: 8,
        ),
        Text(
          status,
          style: TextStyle(
              fontSize: 12, height: 16.5 / 12, color: Color(0xFF666666)),
        )
      ],
    ),
      onTap: () {
        Navigator.of(context).pushNamed("/Userinfo");
      },
    );
  }
}