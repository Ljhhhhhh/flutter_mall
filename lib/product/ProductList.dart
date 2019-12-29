import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductListWidget();
}

class ProductListWidget extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('商品列表'));
  }
}
