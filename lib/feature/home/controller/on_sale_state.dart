import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';

abstract class OnSaleProductState{}
class OnSaleProductStateInitial extends OnSaleProductState{}
class OnSaleProductStateLoading extends OnSaleProductState{}
class OnSaleProductStateSuccess extends OnSaleProductState{
  final List<ProductModel> products ;
  OnSaleProductStateSuccess({required this.products});
}
class OnsSaleProductStateFailure extends OnSaleProductState{}