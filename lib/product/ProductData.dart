class ProductData {
  String name;
  var priceDown;
  var priceUp;
  String mainImg;
  int storeNum;

  ProductData();
  factory ProductData.fromJson(Map<String, dynamic> productDataJson) {
    ProductData productData = ProductData();
    productData.name = productDataJson['title'];
    productData.mainImg = productDataJson['images']['small'];
    productData.storeNum = productDataJson['collect_count'];
    productData.priceDown = productDataJson['rating']['average'];
    productData.priceUp = productDataJson['rating']['average'] + 2;
    return productData;
  }

  

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