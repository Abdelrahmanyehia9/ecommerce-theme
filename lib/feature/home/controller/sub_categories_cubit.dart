import 'package:ecommercetemplate/feature/home/controller/sub_categories_state.dart';
import 'package:ecommercetemplate/feature/home/data/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/category_model.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState>{
  final HomeRepo repo ;
  SubCategoriesCubit(this.repo):super(SubCategoryStateInitial()) ;


  Future<void> fetch(int id)async{
    emit(SubCategoryStateLoading()) ;
    try{
      List<CategoryModel> categories = await repo.fetchSubCategories(id) ;
      emit(SubCategoryStateSuccess(subCategories: categories)) ;


    }catch(e){
      emit(SubCategoryStateFailure()) ;
    }





  }





}