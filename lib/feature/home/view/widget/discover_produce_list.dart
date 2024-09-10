import 'package:ecommercetemplate/feature/home/view/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/dimentions.dart';
import '../../../../core/widgets/browse_all.dart';
import '../../data/model/product_model.dart';

class DiscoverProduceList extends StatelessWidget {
  final String label ;
  final List<ProductModel>products ;
  const DiscoverProduceList({super.key , required this.label , required this.products});

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty? Column(
      children: [
         BrowseAll(
          label: label,
        ),
         SizedBox(
          height: screenHeight(context) * 0.4,
          child: ListView.separated(

              itemCount: products.length,
              separatorBuilder: (context, index) =>
              const SizedBox(
                width: 4,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductItem(
                  model: products[index],
                );
              }),
        ),
      ],
    ) :const SizedBox();
  }
}
class DiscoverProduceListLoading extends StatelessWidget {
  const DiscoverProduceListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BrowseAllLoading() ,
          SizedBox(
            height: screenHeight(context) * 0.3,
            child: ListView.builder(


                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Shimmer.fromColors(baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100, child: Container(
                          width: screenWidth(context) * 0.5,
                          height: screenHeight(context) * 0.3,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) ,
                          color: Colors.white
                          ),
                        ))


                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
