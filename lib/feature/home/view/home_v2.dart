import 'package:ecommercetemplate/feature/home/view/widget/discover_produce_list.dart';
import 'package:ecommercetemplate/feature/home/view/widget/search_text_field.dart';
import 'package:ecommercetemplate/feature/home/view/widget/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/style/text.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/dimentions.dart';
import '../../../core/widgets/advertist_banners.dart';
import '../controller/all_product_cubit.dart';
import '../controller/all_product_state.dart';
import '../controller/feature_product_cubit.dart';
import '../controller/feature_product_state.dart';
import '../controller/on_sale_cubit.dart';
import '../controller/on_sale_state.dart';

class HomeScreenV2 extends StatefulWidget {
  final int id ;
  const HomeScreenV2({super.key , required this.id});

  @override
  State<HomeScreenV2> createState() => _HomeScreenV2State();
}

class _HomeScreenV2State extends State<HomeScreenV2> {

  @override
  void initState() {
    BlocProvider.of<FeatureProductCubit>(context).fetch(1, widget.id) ;
    BlocProvider.of<OnSaleProductCubit>(context).fetch(1, widget.id) ;
    BlocProvider.of<AllProductCubit>(context).fetch(1, widget.id) ;


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text("Discover", style: KTextStyle.h1),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.notifications_outlined,
                color: AppConstants.kPrimaryColor),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              filterProduct(context),
              const SizedBox(
                height: 8,
              ),
              const AdvertBanners(),
              SubCategories(id: widget.id)  ,
              BlocBuilder<FeatureProductCubit , FeatureProductState>(
                builder:  (context  , state){
                  if (state is FeatureProductStateLoading){
                    return  const DiscoverProduceListLoading();
                  }else if (state is FeatureProductStateSuccess){
                    return  DiscoverProduceList(label: "Featured Products", products: state.products,) ;
                  }else{
                    return const Center(child: Text("error please try later"),) ;
                  }

                },) ,
              BlocBuilder<OnSaleProductCubit , OnSaleProductState>(
                builder:  (context  , state){
                  if (state is OnSaleProductStateLoading){
                    return const DiscoverProduceListLoading();
                  }else if (state is OnSaleProductStateSuccess){
                    return  DiscoverProduceList(label: "OnSale Products",products: state.products,) ;
                  }else{
                    return const Center(child: Text("error please try later"),) ;
                  }

                },) ,
              BlocBuilder<AllProductCubit , AllProductState>(
                builder:  (context  , state){
                  if (state is AllProductStateLoading){
                    return const DiscoverProduceListLoading();
                  }else if (state is AllProductStateSuccess){
                    return  DiscoverProduceList(label: "All Products",products: state.products,) ;
                  }else{
                    return const Center(child: Text("error please try later"),) ;
                  }

                },) ,


              // DiscoverProduceList(label: "All Products",) ,

            ],
          ),
        ),
      ),
    ) ;
  }

  Widget filterProduct(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: screenWidth(context) * 0.8,
        child: const SearchTextField(),
      ),
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppConstants.kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset("assets/icons/Filter.svg"),
      ),
    ],
  );
}