class ProductModel{
final int id ;
  final String? title ;
  final String? imgUrl ;
  final String? price  ;
  final String? beforeSale ;
  final String? stockStatus ;


  ProductModel({this.title , this.beforeSale , this.price , this.imgUrl , required this.id , this.stockStatus}) ;
  factory ProductModel.fromJson(Map<String , dynamic> json) => ProductModel(
    id: json['id'],
    title:  json["name"] ,
    price: json['price'] ,
    imgUrl: json['images'][0]["src"],
    beforeSale: json['regular_price'] ,
    stockStatus: json["stock_status"]

  ) ;









}