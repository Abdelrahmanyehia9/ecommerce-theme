import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';

abstract class AllProductState{}
class AllProductStateInitial extends AllProductState{}
class AllProductStateLoading extends AllProductState{}
class AllProductStateSuccess extends AllProductState{
  final List<ProductModel> products ;
  AllProductStateSuccess({required this.products});
}
class AllProductStateFailure extends AllProductState{}