import 'package:ecommercetemplate/feature/home/data/home_repo.dart';
import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_sale_state.dart';

class OnSaleProductCubit extends Cubit<OnSaleProductState>{
  final HomeRepo repo ;
  OnSaleProductCubit(this.repo):super(OnSaleProductStateInitial());





  Future<void> fetch(int pageNumber , int catId)async{

    emit(OnSaleProductStateLoading()) ;
    try{
      List<ProductModel> products = await repo.fetchOnSaleProductsInCategory(pageNumber: pageNumber, categoryId: catId) ;
      emit(OnSaleProductStateSuccess(products: products)) ;



    }catch(e) {
      emit(OnsSaleProductStateFailure());
    }

  }



}