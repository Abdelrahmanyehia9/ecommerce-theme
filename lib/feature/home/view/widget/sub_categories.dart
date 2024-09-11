import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercetemplate/feature/home/controller/all_product_cubit.dart';
import 'package:ecommercetemplate/feature/home/controller/feature_product_cubit.dart';
import 'package:ecommercetemplate/feature/home/controller/on_sale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/dimentions.dart';
import '../../../../core/widgets/browse_all.dart';
import '../../controller/sub_categories_cubit.dart';
import '../../controller/sub_categories_state.dart';
import '../../data/model/category_model.dart';

class SubCategories extends StatefulWidget {
  final int id;
  final void Function(int? id) onSelected ;
  const SubCategories({super.key, required this.id ,required this.onSelected});

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  int _selectedIndex = 0;

  @override
  void initState() {
    BlocProvider.of<SubCategoriesCubit>(context).fetch(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
      builder: (context, state) {
        if (state is SubCategoryStateSuccess) {
          List<CategoryModel> filteredCategories = state.subCategories
              .where((category) => category.count != 0)
              .toList();
          return Column(
            children: [
              const BrowseAll(
                label: "All categories",
              ),
              SizedBox(
                height: screenHeight(context) * .2,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredCategories.length,
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.antiAlias,
                  itemBuilder: (context, index) => subCategoryItem(filteredCategories[index], index), // Pass index here
                ),
              ),
            ],
          );
        } else if (state is SubCategoryStateLoading) {
          return const SubCategoryLoading();
        } else {
          return const SizedBox();
        }
      },
    );
  }

  // Modify subCategoryItem to accept index and handle selection
  Widget subCategoryItem(CategoryModel model, int index) => Padding(
    padding: const EdgeInsets.all(4.0),
    child: InkWell(

      onTap: () {
        setState(() {
          _selectedIndex = index;
          BlocProvider.of<AllProductCubit>(context).fetch(1, model.id)  ;
          BlocProvider.of<FeatureProductCubit>(context).fetch(1, model.id)  ;
          BlocProvider.of<OnSaleProductCubit>(context).fetch(1, model.id)  ;
          widget.onSelected(model.id) ;

        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _selectedIndex == index
                    ? AppConstants.kPrimaryColor
                    : Colors.transparent, // Show border only if selected
                width: 2.2,
              ),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppConstants.kPrimaryColor,
              child: CachedNetworkImage(
                imageUrl: model.imgUrl ?? "",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const CircularProgressIndicator(
                  color: Colors.white,
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center ,
              model.name?.replaceAll(" ", "\n") ?? "",
              style: const TextStyle(
                color: AppConstants.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class SubCategoryLoading extends StatelessWidget {
  const SubCategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const BrowseAllLoading(),
        SizedBox(
          height: screenHeight(context) * .175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: AppConstants.shimmerBaseColor ,
                    highlightColor: AppConstants.shimmerHeightLightColor ,
                    child: const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Shimmer.fromColors(
                    baseColor: AppConstants.shimmerBaseColor ,
                    highlightColor: AppConstants.shimmerHeightLightColor ,
                    child: Container(
                      width: screenWidth(context) * .2,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
