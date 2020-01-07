import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/product/ProductData.dart';
import 'package:flutter_mall/product/ProductItem.dart';

class UserWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserWidgetState();
}

class UserWidgetState extends State<UserWidget> {
  List<ProductData> productListData = new List<ProductData>();
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  Response<dynamic> response;
  Dio dio = Dio();
  var start = 0;

  @override
  void initState() {
    super.initState();
    _getData();
    _scrollController.addListener(() {
//      print("滑动pixels："+_scrollController.position.pixels.toString());
//      print("滑动maxScrollExtent："+_scrollController.position.maxScrollExtent.toString());
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    // print(productListData);
  }

  void dispose() {
    super.dispose();
  }

  Future<List<ProductData>> fakeRequest() async {
    return Future.delayed(Duration(seconds: 2), () {
      return [
        // ProductData(
        //     '宝3马', 4300, 5500, 'http://img.cixi518.com/ljh_logo.jpeg', 2345),
        // ProductData(
        //     '宝2马', 4300, 5500, 'http://img.cixi518.com/ljh_logo.jpeg', 2345),
        // ProductData(
        //     '宝1马', 4300, 5500, 'http://img.cixi518.com/ljh_logo.jpeg', 2345),
      ];
    });
  }

  void _getData() async {
    response = await dio.get(
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=宁波&start=' +
            start.toString() +
            '&count=10&client=&udid=');
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

  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      List<ProductData> newEntries = await fakeRequest();
      setState(() {
        productListData.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Opacity(
            opacity: isPerformingRequest ? 1.0 : 0.0,
            child: new CircularProgressIndicator(),
          )
          ]
          ),
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new RefreshIndicator(
      onRefresh: _handleRefresh,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //每行三列
            childAspectRatio: 172.5 / 232 //显示区域宽高相等
            ),
        itemCount: productListData.length,
        itemBuilder: (context, index) {
          if (index == productListData.length) {
            return _buildProgressIndicator();
          } else {
            return ProductItem(productListData[index]);
          }
        },
        controller: _scrollController,
      ),
    ));
  }

  Future _handleRefresh() async {
    // 延迟3秒后添加新数据， 模拟网络加载
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        print('refresh');
        // _suggestions.clear();
        // _suggestions.addAll(generateWordPairs().take(20));
        // return _suggestions;
      });
    });
  }
}

// class LoadMoreWidger extends StatelessWidget{
//   @override

// }
