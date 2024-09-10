import 'package:ecommercetemplate/feature/home/controller/main_categories_state.dart';
import 'package:ecommercetemplate/feature/home/data/home_repo.dart';
import 'package:ecommercetemplate/feature/home/data/model/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCategoriesCubit extends Cubit<MainCategoriesState>{
  final HomeRepo repo ;
  MainCategoriesCubit(this.repo):super(MainCategoriesStateInitial()) ;


  Future<void> fetch()async{
    emit(MainCategoriesStateLoading()) ;
    try{
      List<CategoryModel> categories = await repo.fetchMainCategories() ;
      emit(MainCategoriesStateSuccess(categories: categories)) ;


    }catch(e){
      print(e.toString());
      emit(MainCategoriesStateFailure()) ;
    }





  }





}