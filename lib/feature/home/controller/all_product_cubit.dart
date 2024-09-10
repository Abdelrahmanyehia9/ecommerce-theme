import 'package:ecommercetemplate/feature/home/data/home_repo.dart';
import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState>{
  final HomeRepo repo ;
  AllProductCubit(this.repo):super(AllProductStateInitial());
  Future<void> fetch(int pageNumber , int catId)async{

    emit(AllProductStateLoading()) ;
    try{
      List<ProductModel> products = await repo.fetchAllProductsInCategory(pageNumber: pageNumber, categoryId: catId) ;
      emit(AllProductStateSuccess(products: products)) ;



    }catch(e) {
      print(e.toString());
      emit(AllProductStateFailure());
    }

  }



}