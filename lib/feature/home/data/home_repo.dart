import 'package:ecommercetemplate/feature/home/data/model/category_model.dart';
import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';
import '../../../core/service/api_service.dart';

class HomeRepo {
  ApiService service;
  HomeRepo(this.service);
  Future<List<ProductModel>> fetchFeatureProductsInCategory(
      {required int pageNumber, required int categoryId}) async {
    List<ProductModel> products = [];
    var response = await service
        .get("products?category=$categoryId&page=$pageNumber&per_page=8&featured=true");
    for (var item in response) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
  Future<List<ProductModel>> fetchOnSaleProductsInCategory(
      {required int pageNumber, required int categoryId}) async {
    List<ProductModel> products = [];
    var response = await service
        .get("products?category=$categoryId&page=$pageNumber&per_page=8&on_sale=true");
    for (var item in response) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
  Future<List<ProductModel>> fetchAllProductsInCategory(
      {required int pageNumber, required int categoryId}) async {
    List<ProductModel> products = [];
    var response =
        await service.get("products?category=$categoryId&page=$pageNumber&per_page=8");
    for (var item in response) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
  Future<List<CategoryModel>> fetchSubCategories(int id) async {
    CategoryModel model = CategoryModel(
        id: id,
        name: "all",
        imgUrl:
            "https://daralbanat.com/wp-content/uploads/2024/02/logo-gif-1.gif");

    List<CategoryModel> categories = [model];
    var response =
        await service.get("products/categories?parent=$id&per_page=10");
    for (var item in response) {
      categories.add(CategoryModel.fromJson(item));
    }
    return categories;
  }
  Future<List<CategoryModel>> fetchMainCategories() async {
    List<CategoryModel> categories = [];
    var response =
        await service.get("products/categories?parent=0&per_page=20");
    for (var item in response) {
      categories.add(CategoryModel.fromJson(item));
    }
    return categories;
  }
}
