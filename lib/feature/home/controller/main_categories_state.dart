import 'package:ecommercetemplate/feature/home/data/model/category_model.dart';

abstract class MainCategoriesState{}
class MainCategoriesStateInitial extends MainCategoriesState{}
class MainCategoriesStateLoading extends MainCategoriesState{}
class MainCategoriesStateSuccess extends MainCategoriesState{

  final List<CategoryModel> categories ;

  MainCategoriesStateSuccess({required this.categories});
}
class MainCategoriesStateFailure extends MainCategoriesState{}