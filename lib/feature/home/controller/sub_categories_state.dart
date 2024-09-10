
import '../data/model/category_model.dart';

abstract class SubCategoriesState{}
class SubCategoryStateInitial extends SubCategoriesState{}
class SubCategoryStateLoading extends SubCategoriesState{}
class SubCategoryStateSuccess extends SubCategoriesState{
  final List<CategoryModel> subCategories ;
  SubCategoryStateSuccess({required this.subCategories});
}
class SubCategoryStateFailure extends SubCategoriesState{}