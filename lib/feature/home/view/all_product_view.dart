import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercetemplate/core/style/text.dart';
import 'package:ecommercetemplate/core/utils/dimentions.dart';
import 'package:ecommercetemplate/feature/home/controller/all_product_cubit.dart';
import 'package:ecommercetemplate/feature/home/data/model/product_model.dart';
import 'package:ecommercetemplate/feature/home/view/home_v2.dart';
import 'package:ecommercetemplate/feature/home/view/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../core/utils/app_constants.dart';

class AllProductsView extends StatefulWidget {
  final int categoryID ;
  const AllProductsView({super.key, required this.categoryID,});

  @override
  State<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  final PagingController<int, ProductModel> _pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newData = await BlocProvider.of<AllProductCubit>(context).repo
          .fetchAllProductsInCategory(pageNumber: pageKey, categoryId: widget.categoryID);
      final isLastPage = newData.isEmpty;
      if (isLastPage) {
        _pagingController.appendLastPage(newData);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newData, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
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
        child: Column(
          children: [
            const FilterAndSearchProduct(),
            const SizedBox(height: 18),
            Expanded(
              child: PagedGridView<int, ProductModel>(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , childAspectRatio: 0.55),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                  itemBuilder: (context, item, index) => ProductItem(
                    model: item,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productItem(ProductModel model, BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                    width: screenWidth(context) * 0.5,
                    height: screenHeight(context) * 0.3,
                    child: CachedNetworkImage(
                      imageUrl: model.imgUrl ??
                          "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppConstants.kPrimaryColor,
                        ),
                        child: Image.asset(
                            AppConstants.lightPlaceholderImage),
                      ),
                    )),
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
                        blurRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.favorite_outline,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: screenWidth(context) * .5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              model.title ?? "",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
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
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            model.beforeSale != null && model.price != null
                ? () {
              double? beforeSaleValue =
              double.tryParse(model.beforeSale!);
              double? priceValue = double.tryParse(model.price!);

              if (beforeSaleValue != null && priceValue != null) {
                double difference = beforeSaleValue - priceValue;
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8.0),
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
        ),
      ],
    ),
  );
}
