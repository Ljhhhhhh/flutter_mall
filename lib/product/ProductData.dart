class ProductData {
  String name;
  int priceDown;
  int priceUp;
  String mainImg;
  int storeNum;

  ProductData(this.name, this.priceDown, this.priceUp, this.mainImg, this.storeNum);

  // factory ProductData.fromJson(Map<String, dynamic> movieDataJson) {
  //   ProductData productData = ProductData();
  //   productData.name = '1';
  //   productData.priceDown = 2;
  //   productData.priceUp = 3;
  //   productData.mainImg = '1';
  //   productData.storeNum = 4;
  //   return productData;
  // }
}