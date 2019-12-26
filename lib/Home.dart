import 'package:flutter/material.dart';
import 'package:flutter_mall/components/icon.dart';

void main() => runApp(HomeWidget());

class HomeWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '首页',
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

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index; //刷新界面
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.green,
          // textTheme: ThemeData.light,
          title: Text(widget.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                      Text('下拉')
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
                            color: Colors.red,
                            child: Container(
                              width: 185,
                              height: 75,
                            )),
                        Material(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                            child: Container(
                              width: 185,
                              height: 75,
                            )),
                        // Expanded(
                        //   flex: 1,
                        //   child: Container(
                        //     width: 172.5,
                        //     height: 75,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              )),
          Text('主题')
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
