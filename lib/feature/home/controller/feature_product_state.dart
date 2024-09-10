import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';

abstract class FeatureProductState{}
class FeatureProductStateInitial extends FeatureProductState{}
class FeatureProductStateLoading extends FeatureProductState{}
class FeatureProductStateSuccess extends FeatureProductState{
  final List<ProductModel> products ;
  FeatureProductStateSuccess({required this.products});
}
class FeatureProductStateFailure extends FeatureProductState{}