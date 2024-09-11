import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercetemplate/core/router/app_router.dart';
import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:ecommercetemplate/core/utils/dimentions.dart';
import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel model;
  const ProductItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(model.id);
        Navigator.pushNamed(context, AppRouter.singleProductScreen) ;
      } ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: screenWidth(context) * 0.5,
                  height: screenHeight(context) * 0.3,
                  child: CachedNetworkImage(imageUrl: model.imgUrl ??
                      "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
                  fit: BoxFit.cover,
                  placeholder: (context , url)=>Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) ,
                    color: AppConstants.kPrimaryColor),
                      child: Image.asset(AppConstants.lightPlaceholderImage ,)),
                  )
                ),
              ),
              Positioned(
                top: 24,right: 18,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            offset: const Offset(0, 5),
                            spreadRadius: 1,
                            blurRadius: 5)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ) ,
              model.stockStatus == "outofstock" ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: AppConstants.kPrimaryColor,
                      boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3) ,
                        color: Colors.grey.withOpacity(0.5) ,
                        spreadRadius: 2 ,
                        blurRadius: 4
                      )
                    ]
                  ),
                  child: Text("out of stock" , style: TextStyle(color: Colors.white),),
                ),
              ) : SizedBox()
            ],
          ),
          SizedBox(
            width: screenWidth(context) * .5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                model.title ?? "",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  "د.ك${model.price}",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              model.beforeSale != null && model.price != null
                  ? () {
                double? beforeSaleValue = double.tryParse(model.beforeSale!);
                double? priceValue = double.tryParse(model.price!);

                if (beforeSaleValue != null && priceValue != null) {
                  double difference = beforeSaleValue - priceValue;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "-${difference.toStringAsFixed(1)} د.ك",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox(); // Handle parsing error
                }
              }()
                  : const SizedBox(), // Handle null values

            ],
          )
        ],
      ),
    );
  }
}
