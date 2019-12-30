import 'package:flutter/material.dart';
import 'package:flutter_mall/Home.dart';
import 'package:flutter_mall/product/ProductList.dart';
import 'package:flutter_mall/userCenter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '37度礼购积分商城',
      routes: {
        // '/': (context) => MyHomePage(),
        '/Product': (context) => ProductList(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
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
      body: _widgetItems[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('我的')),
        ],
        currentIndex: _currentIndex,
        fixedColor: Color(0xffE2B55D),
        type: BottomNavigationBarType.fixed,
        onTap: (_onItemTapped),
      ),
    );
  }
}
