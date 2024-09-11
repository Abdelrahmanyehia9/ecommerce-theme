class ProductDetailsModel {
  final int id;
  final String name;
  final List<String> images;
  final String? price;
  final String? priceBeforeSale;
  final String averageRating;
  final int ratingCount;
  final List<String>? tags;
  final List<String>? option;
  final String? availabilityInStock;
  final String description;
  final List<int> similarProductID;
  final List<String>? productCategories;

  //additional info
// rating
//

  ProductDetailsModel(
      {required this.id,
      required this.name,
      required this.images,
      required this.price,
      required this.priceBeforeSale,
      required this.averageRating,
      required this.ratingCount,
      required this.tags,
      required this.option,
      required this.availabilityInStock,
      required this.description,
      required this.similarProductID,
      this.productCategories});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    List<String> imageUrls  = [] ;
    List<String>  productCategories = [] ;
    if (json['images'] != null) {
      imageUrls = List<String>.from(
          json['images'].map((image) => image['src'] as String));
    }
    if (json['categories'] != null) {
      productCategories = List<String>.from(
          json['categories'].map((cat) => cat['name'] as String));
    }

    return ProductDetailsModel(
      id: json['id'],
      name: json["name"],
      images: imageUrls,
      price: json["price"],
      priceBeforeSale: json["regular_price"],
      averageRating: json["average_rating"],
      ratingCount: json["rating_count"],
      tags: json["tags"],
      option: List<String>.from(json["attributes"]["option"]),
      availabilityInStock: json["stock_status"],
      description: json["description"],
      similarProductID: json["related_ids"],
      productCategories: productCategories
    );
  }
}
