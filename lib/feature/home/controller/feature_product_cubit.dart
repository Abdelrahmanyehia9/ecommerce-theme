import 'package:ecommercetemplate/feature/home/controller/feature_product_state.dart';
import 'package:ecommercetemplate/feature/home/data/home_repo.dart';
import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureProductCubit extends Cubit<FeatureProductState>{
  final HomeRepo repo ;
  FeatureProductCubit(this.repo):super(FeatureProductStateInitial());
  Future<void> fetch(int pageNumber , int catId)async{

    emit(FeatureProductStateLoading()) ;
    try{
      List<ProductModel> products = await repo.fetchFeatureProductsInCategory(pageNumber: pageNumber, categoryId: catId) ;
      emit(FeatureProductStateSuccess(products: products)) ;



    }catch(e) {
      print(e.toString());
      emit(FeatureProductStateFailure());
    }

  }



}