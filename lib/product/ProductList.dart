import 'package:flutter/material.dart';
import 'package:flutter_mall/product/ProductData.dart';
import 'package:flutter_mall/product/ProductItem.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductListWidget();
}

class ProductListWidget extends State<ProductList> {
  List<ProductData> productListData = new List<ProductData>();

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
        // ProductData(
        //     '路虎', 6300, 7500, 'http://img.cixi518.com/ljh_logo.jpeg', 4567),
        // ProductData(
        //     '奔驰', 3300, 4500, 'http://img.cixi518.com/ljh_logo.jpeg', 1234),
        // ProductData(
        //     '宝马', 4300, 5500, 'http://img.cixi518.com/ljh_logo.jpeg', 2345),
        // ProductData(
        //     '奥迪', 6300, 7500, 'http://img.cixi518.com/ljh_logo.jpeg', 3456),
        // ProductData(
        //     '路虎', 6300, 7500, 'http://img.cixi518.com/ljh_logo.jpeg', 4567),
        // ProductData(
        //     '奥迪', 6300, 7500, 'http://img.cixi518.com/ljh_logo.jpeg', 3456),
        // ProductData(
        //     '路虎', 6300, 7500, 'http://img.cixi518.com/ljh_logo.jpeg', 4567),
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
          title: Text('商品列表')),
      body: Container(
        // padding: EdgeInsets.all(8),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('价格', style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54
                ),),
                Container(
                  width: 8.5,
                ),
                Image.asset('images/sort-icon.png', width: 8)
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
                  }))

          // GridView.builder(
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: 2, //每行三列
          //               childAspectRatio: 172.5 / 232 //显示区域宽高相等
          //               ),
          //           itemCount: productListData.length,
          //           itemBuilder: (context, index) {
          //             return ProductItem(productListData[index]);
          //           })
          //           )
        ]),
      ),
    );
    // return
  }
}
