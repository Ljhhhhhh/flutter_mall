import 'package:flutter/material.dart';
import 'package:flutter_mall/components/icon.dart';
import 'package:flutter_mall/product/ProductData.dart';
import 'package:flutter_mall/product/ProductItem.dart';

void main() => runApp(HomeWidget());

class HomeWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '37度礼购积分商城',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: HomeWidgetState(title: '首页'),
    );
  }
}

class HomeWidgetState extends StatefulWidget {
  HomeWidgetState({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeWidgetState> {
  int currentIndex = 0;
  List<ProductData> productListData = new List<ProductData>();

  // void _onItemTapped(int index) {
  //   setState(() {
  //     currentIndex = index; //刷新界面
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _getData();
    // print(productListData);
  }

  void _getData() {
    setState(() {
      productListData = [
        ProductData(
            '奔驰', 3300, 4500, 'http://img.cixi518.com/ljh_logo.jpeg', 1234),
        ProductData(
            '宝马', 4300, 5500, 'http://img.cixi518.com/ljh_logo.jpeg', 2345),
        ProductData(
            '奥迪', 6300, 7500, 'http://img.cixi518.com/ljh_logo.jpeg', 3456),
        ProductData(
            '路虎', 6300, 7500, 'http://img.cixi518.com/ljh_logo.jpeg', 4567),
      ];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.green,
          // textTheme: ThemeData.light,
          title: Text(widget.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/home-banner.png"),
                      fit: BoxFit.cover)),
              width: MediaQuery.of(context).size.width,
              height: 147.5,
              margin: EdgeInsets.only(bottom: 50),
              child: Stack(
                alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                overflow: Overflow.visible,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Iconfont.store, color: Colors.white),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('雅戈尔装饰有限公司',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white))),
                      Icon(Icons.keyboard_arrow_down,
                          color: Colors.white, size: 28)
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 110,
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Material(
                            borderRadius: BorderRadius.circular(5),
                            // color: Colors.blue,
                            child: Container(
                              width: 182,
                              height: 75,
                              child: Flex(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage("images/home-menu1.png"),
                                    width: 62.0,
                                    height: 70.0,
                                  ),
                                  Container(
                                    width: 14,
                                    height: 1,
                                  ),
                                  Flex(
                                    direction: Axis.vertical,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('37度礼购',
                                          style: TextStyle(
                                              fontSize: 16,
                                              height: 1.40625,
                                              color: Color(0xFF333333))),
                                      Container(
                                        height: 4,
                                        width: 1,
                                      ),
                                      Text('礼购大促销',
                                          style: TextStyle(
                                              fontSize: 12,
                                              height: 1.375,
                                              color: Color(0xFF999999)))
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        Material(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: 182,
                              height: 75,
                              child: Flex(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage("images/home-menu2.png"),
                                    width: 72.0,
                                    height: 44.0,
                                  ),
                                  Container(
                                    width: 14,
                                    height: 1,
                                  ),
                                  Flex(
                                    direction: Axis.vertical,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('商家加盟',
                                          style: TextStyle(
                                              fontSize: 16,
                                              height: 1.40625,
                                              color: Color(0xFF333333))),
                                      Container(
                                        height: 4,
                                        width: 1,
                                      ),
                                      Text('合作共赢',
                                          style: TextStyle(
                                              fontSize: 12,
                                              height: 1.375,
                                              color: Color(0xFF999999)))
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('积分商城',
                    style: TextStyle(
                        fontSize: 15,
                        height: 21 / 15,
                        fontWeight: FontWeight.bold)),
                // Row(
                //   children: <Widget>[
                //     Text('查看更多'),
                //     Icon(
                //       Icons.keyboard_arrow_right,
                //       color: Color(0xFF333333),
                //       size: 24,
                //     ),
                //   ],
                // )
                RaisedButton.icon(
                  label: Text("查看更多"),
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    color: Color(0xFF333333),
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Product');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //每行三列
                    childAspectRatio: 172.5 / 232 //显示区域宽高相等
                    ),
                itemCount: productListData.length,
                itemBuilder: (context, index) {
                  return ProductItem(productListData[index]);
                }
                // children: <Widget>[
                //   ,
                //   ],
                ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
