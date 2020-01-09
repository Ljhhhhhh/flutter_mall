import 'package:flutter/material.dart';
import 'package:flutter_mall/components/icon.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mall/product/ProductData.dart';
import 'package:flutter_mall/product/ProductItem.dart';
// import 'package:flutter_mall/product/ProductList.dart';

void main() => runApp(HomeWidget());

class HomeWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HomeWidgetState(title: '首页');
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
  Response<dynamic> response;
  Dio dio = Dio();

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

  void _getData() async {
    response = await dio.get(
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=宁波&start=0&count=6&client=&udid=');
    var data = response.data;
    List<ProductData> newEntries = new List();
    for (dynamic product in data['subjects']) {
      ProductData productData = ProductData.fromJson(product);
      newEntries.add(productData);
    }
    setState(() {
      productListData = newEntries;
    });
  }

  Widget build(BuildContext context) {
    Widget listContainer = GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //每行三列
            childAspectRatio: 172.5 / 232 //显示区域宽高相等
            ),
        itemCount: productListData.length,
        itemBuilder: (context, index) {
          if (productListData.length == 0) {
            return Text('加载中……');
          }
          return ProductItem(productListData[index]);
        });

    if (productListData.length == 0) {
      listContainer = Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            strokeWidth: 4.0,
            semanticsLabel: '加载中',
            ),
          Container(
            width: 15,
          ),
          Text('数据加载中……', style: TextStyle(
            fontSize: 18,
            color: Colors.blue
          ))
        ]);
    }
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
                GestureDetector(
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
                  onTap: () {
                    // await Navigator.pushNamed(context, '/Product');
                    // Navigator.pushNamed("/Product");
                    Navigator.of(context).pushNamed("/Product");
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => ProductList()));
                  },
                ),
                // FlatButton(
                //   child: Flex(
                //     direction: Axis.horizontal,
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: <Widget>[
                //       Text("查看更多", textAlign: TextAlign.right),
                //       Icon(
                //         Icons.keyboard_arrow_right,
                //         color: Color(0xFF333333),
                //         size: 24,
                //       ),
                //     ],
                //   ),
                //   textColor: Color(0xFF333333),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/Product');
                //   }
                //   // onPressed: () {
                //   //   Navigator.push(
                //   //       context,
                //   //       MaterialPageRoute(
                //   //           builder: (context) => ProductList(),
                //   //           maintainState: false));
                //   // },
                // ),
              ],
            ),
          ),
          Expanded(flex: 1, child: listContainer)
        ],
      ),
    );
  }
}
