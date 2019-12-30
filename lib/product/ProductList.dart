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
        ProductData(
            '路虎', 6300, 7500, 'http://img.cixi518.com/ljh_logo.jpeg', 4567),
      ];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.green,
          // textTheme: ThemeData.light,
          title: Text('商品列表')),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Container(
                child: Text('1234', style: TextStyle(color: Colors.red),),
              ),
              // Expanded(
              //   flex: 1,
              //   child: GridView.builder(
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2, //每行三列
              //           childAspectRatio: 172.5 / 232 //显示区域宽高相等
              //           ),
              //       itemCount: productListData.length,
              //       itemBuilder: (context, index) {
              //         return ProductItem(productListData[index]);
              //       }
              //       // children: <Widget>[
              //       //   ,
              //       //   ],
              //       ),
              // )
            ],
          )
        ],
      ),
    );
    // return
  }
}
