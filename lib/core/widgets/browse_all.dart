import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:ecommercetemplate/core/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BrowseAll extends StatelessWidget {
  final String label;

  final GestureTapCallback? onTap;

  const BrowseAll({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0 , horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          InkWell(
              onTap: onTap,
              child: const Text(
                "see all ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              )),
        ],
      ),
    );
  }
}
class BrowseAllLoading extends StatelessWidget {
  const BrowseAllLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Shimmer.fromColors(
            baseColor: AppConstants.shimmerBaseColor, highlightColor: AppConstants.shimmerHeightLightColor, child: Container(
          width: screenWidth(context) *0.5 ,
          height: 20,
          decoration: BoxDecoration(
              color: Colors.white ,
              borderRadius: BorderRadius.circular(4)
          ),
        )) ,
        Shimmer.fromColors(
            baseColor: AppConstants.shimmerBaseColor, highlightColor: AppConstants.shimmerHeightLightColor, child: Container(
          width: screenWidth(context) *0.2 ,
          height: 12,
          decoration: BoxDecoration(
              color: Colors.white ,
              borderRadius: BorderRadius.circular(4)
          ),
        )) ,





      ],),
    ) ;
  }
}
