import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/product/ProductData.dart';
import 'package:flutter_mall/product/ProductItem.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductListWidget();
}

class ProductListWidget extends State<ProductList> {
  List<ProductData> productListData = new List<ProductData>();
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  Response<dynamic> response;
  Dio dio = Dio();
  int start = 0;
  int total = 0;
  bool loadedAll = false;

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
      return [];
    });
  }

  void _getData() async {
    response = await dio.get(
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=宁波&start=' +
            start.toString() +
            '&count=10&client=&udid=');
    var data = response.data;
    total = data['total'];
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
    // print(total);
    // print(productListData.length);
    if (productListData.length >= total) {
      print('已加载全部');
      loadedAll = true;
      return false;
    }
    if (!isPerformingRequest) {
      setState(() {
        isPerformingRequest = true;
        start = start + 10;
      });
      
      int count = start + 10 > total ? total - start : 10;
      response = await dio.get(
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=宁波&start=' +
            start.toString() +
            '&count=' + count.toString() +'&client=&udid=');
    var data = response.data;
    
    List<ProductData> newEntries = new List();
    for (dynamic product in data['subjects']) {
      ProductData productData = ProductData.fromJson(product);
      newEntries.add(productData);
    }
      setState(() {
        productListData.addAll(newEntries);
        isPerformingRequest = false;
      });
    }
  }

  Future _handleRefresh() async {
    setState(() {
      start = 0;
      productListData = [];
    });
    // 延迟3秒后添加新数据， 模拟网络加载
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

  Widget _buildProgressIndicator() {
    return Container(
      // padding: const EdgeInsets.all(8.0),
      child: Text('加载中……'),
      // child:
      //     Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      //   new Opacity(
      //     opacity: isPerformingRequest ? 1.0 : 0.0,
      //     child: new CircularProgressIndicator(),
      //   )
      // ]),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.green,
          // textTheme: ThemeData.light,
          title: Text('商品列表')),
      body: Container(
        // padding: EdgeInsets.all(8),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '价格',
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                Container(
                  width: 8.5,
                ),
                Image.asset('images/sort-icon.png', width: 8)
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: new RefreshIndicator(
              onRefresh: _handleRefresh,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //每行三列
                    childAspectRatio: 172.5 / 232 //显示区域宽高相等
                    ),
                itemCount: productListData.length,
                itemBuilder: (context, index) {
                  if (index == productListData.length) {
                    // return LoadingIndicator(dataLoader: dataLoader);
                    return _buildProgressIndicator();
                  } else {
                    return ProductItem(productListData[index]);
                  }
                },
                controller: _scrollController,
              ),
            ),
          ),
          
        ]),
      ),
    );
    // return
  }
}
