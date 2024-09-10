class CategoryModel{
  final int id ;
  final String? name;
  final String? imgUrl ;
  final int? count ;

  CategoryModel({this.imgUrl , this.name  , this.count , required this.id}) ;
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"] ?? '',
    imgUrl: json["image"] != null ? json["image"]["src"] : null,
    count: json["count"] ?? 0,
  );









}