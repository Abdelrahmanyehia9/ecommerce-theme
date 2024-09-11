
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';
import 'package:ecommercetemplate/feature/home/view/widget/discover_produce_list.dart';
import 'package:ecommercetemplate/feature/product/view/widgets/add_to_cart_button.dart';
import 'package:ecommercetemplate/feature/product/view/widgets/custom_accordion.dart';
import 'package:ecommercetemplate/feature/product/view/widgets/product_slide.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/dimentions.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({super.key});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  final ScrollController _scrollController = ScrollController();
  List<ProductModel> products = [ProductModel(id: 0), ProductModel(id: 2)];
  int _selectedIndex = 0;
  bool _isAppBarWhite = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > screenHeight(context)*.6) {
        if (!_isAppBarWhite) {
          setState(() {
            _isAppBarWhite = true;
          });
        }
      } else {
        if (_isAppBarWhite) {
          setState(() {
            _isAppBarWhite = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: productAppBar() ,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Slider product
                const ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: ProductSlider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleWithPrice(),
                      ratings(),
                      productTags(),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 65,
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => productOption(index),
                        ),
                      ),
                      availabilityOfProduct(),
                      const CustomAccordion(),
                      SizedBox(
                        child: DiscoverProduceList(
                          label: "Similar Products",
                          products: products,
                          showSeeAll: false,
                        ),
                      ),
                      const Text(
                        "   #category1  #category2",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppConstants.kPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const AddToCartButton(),
        ],
      ),
    );
  }

  Widget priceText() => const Row(
    children: [
      Text(
        "40د.ك",
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
          decoration: TextDecoration.lineThrough,
          decorationColor: Colors.grey,
        ),
      ),
      SizedBox(
        width: 4,
      ),
      Text(
        "25د.ك",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ],
  );
  Widget titleWithPrice() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 18,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: screenWidth(context) * 0.6,
            child: const Text(
              "Pineapple Beach Mat",
              style: TextStyle(fontSize: 24),
            ),
          ),
          priceText(),
        ],
      ),
    ],
  );
  Widget ratings() => Row(
    children: [
      AnimatedRatingStars(
        readOnly: true,
        initialRating: 2,
        onChanged: (value) {},
        customEmptyIcon: Icons.star_rate_outlined,
        customHalfFilledIcon: Icons.star_half,
        customFilledIcon: Icons.star,
        emptyColor: Colors.amber,
        starSize: 20,
        displayRatingValue: false,
      ),
      const SizedBox(
        width: 4,
      ),
      const Text(
        "(85 reviews)",
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );
  Widget productTags() => Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 4,
      runSpacing: 4,
      children: List.generate(8, (index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: AppConstants.kPrimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "tag${index + 1}",
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      }),
    ),
  );
  Widget productOption(int index) => InkWell(
    onTap: () {
      setState(() {
        _selectedIndex = index;
      });
    },
    child: CircleAvatar(
      radius: 22,
      backgroundColor: _selectedIndex == index
          ? AppConstants.kPrimaryColor
          : Colors.white,
      child: Text(
        "L",
        style: TextStyle(
          color: _selectedIndex == index
              ? Colors.white
              : AppConstants.kPrimaryColor,
        ),
      ),
    ),
  );
  Widget availabilityOfProduct() => const Row(
    children: [
      CircleAvatar(
        backgroundColor: Colors.green,
        radius: 6,
      ),
      SizedBox(
        width: 4,
      ),
      Text(
        " available in stock",
        style: TextStyle(color: Colors.green),
      ),
    ],
  );
  PreferredSizeWidget productAppBar()=>AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: _isAppBarWhite ? Theme.of(context).scaffoldBackgroundColor : Colors.transparent,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: _isAppBarWhite
            ? Colors.grey.withOpacity(0.2)
            : Colors.white.withOpacity(0.4),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
      ),

    ),
    actions: [
      CircleAvatar(
        backgroundColor: _isAppBarWhite
            ? Colors.grey.withOpacity(0.2)
            : Colors.white.withOpacity(0.4),
        child: const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
      SizedBox(width: 8,),
      CircleAvatar(
        backgroundColor: _isAppBarWhite
            ? Colors.grey.withOpacity(0.2)
            : Colors.white.withOpacity(0.4),
        child: const Icon(
          Icons.more_vert,
        ),
      ),
      SizedBox(width: 18,)

    ],
  ) ;
}
