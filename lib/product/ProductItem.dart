import 'package:flutter/material.dart';
import 'package:flutter_mall/components/icon.dart';
import 'package:flutter_mall/product/ProductData.dart';

class ProductItem extends StatefulWidget {
  ProductData productData;

  ProductItem(this.productData);

  @override
  State<StatefulWidget> createState() {
    return ProductItemWidget();
  }
}

class ProductItemWidget extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Material(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Flex(
              direction: Axis.vertical,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  widget.productData.mainImg,
                  width: 152.5,
                  height: 152.5,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 5),
                  alignment: Alignment.topLeft,
                  // 
                  child: Text(widget.productData.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        height: 21 / 15,
                        color: Color(0xFF666666),
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                    // mainAxisAlignment: MainAxisAlignment.center,
                    child: Row(children: <Widget>[
                      Icon(Iconfont.jifen,
                          color: Color(0xFFE2B55D), size: 15),
                      Container(width: 3, height: 1),
                      Text(
                        widget.productData.priceDown.toString() + '-' + widget.productData.priceUp.toString(),
                        style: TextStyle(
                            color: Color(0xFFE2B55D),
                            fontSize: 15,
                            height: 21 / 15),
                      )
                    ])),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '库存：' + widget.productData.storeNum.toString(),
                    // '3412341',
                    style: TextStyle(
                        fontSize: 12,
                        height: 16.5 / 12,
                        color: Color(0xFF999999)),
                  ),
                )
              ],
            ),
          )));
  }
}