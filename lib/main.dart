import 'package:flutter/material.dart';
import 'package:flutter_mall/Home.dart';
import 'package:flutter_mall/components/icon.dart';
import 'package:flutter_mall/userCenter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '首页',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: MyHomePage(title: '首页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _widgetItems = [HomeWidget(), UserWidget()];

  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _currentIndex = index; //刷新界面
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   // backgroundColor: Colors.green,
      //   // textTheme: ThemeData.light,
      //   title: Text(widget.title)
      // ),
      body: _widgetItems[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('我的')),
        ], //BottomNavigationBarItem 的 icon 用的是 Icon Widget实现的，这里是随便找的图标，先实现功能，后续在改成和 豆瓣电影 的一样
        currentIndex: _currentIndex, //默认选中的 index
        fixedColor: Color(0xffE2B55D), //选中时颜色变为黑色
        type: BottomNavigationBarType.fixed, //类型为 fixed
        onTap: (_onItemTapped),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
