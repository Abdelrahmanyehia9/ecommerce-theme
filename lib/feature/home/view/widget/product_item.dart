import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:ecommercetemplate/core/utils/dimentions.dart';
import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel model;
  const ProductItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: screenWidth(context) * 0.5,
                height: screenHeight(context) * 0.3,
                child: CachedNetworkImage(imageUrl: model.imgUrl ??
                    "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
                placeholder: (context , url)=>Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) ,
                  color: AppConstants.kPrimaryColor),
                    child: Image.asset(AppConstants.lightPlaceholderImage ,)),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
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
                  size: 18,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 12,
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
    );
  }
}
