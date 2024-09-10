import 'package:cached_network_image/cached_network_image.dart';
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
  final int id ;
  const SubCategories({super.key ,required this.id});

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {

  @override
  void initState() {
    BlocProvider.of<SubCategoriesCubit>(context).fetch(widget.id) ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoriesCubit , SubCategoriesState>(
      builder: (context , state){

        if (state is SubCategoryStateSuccess){
          return Column(
            children: [
              const BrowseAll(
                label: "All categories",
              ),
              SizedBox(
                height: screenHeight(context) * .15,
                child: ListView.builder(
                    itemCount: state.subCategories.length,
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) => subCategoryItem(state.subCategories[index])),
              ),
            ],
          ) ;
        }else if (state is SubCategoryStateLoading) {
          return const SubCategoryLoading() ;
        }else{
          return const SizedBox()  ;
        }
      },
    );
  }

  Widget subCategoryItem(CategoryModel model ) =>  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: AppConstants.kPrimaryColor,  // Background color

          child: CachedNetworkImage(
            imageUrl: model.imgUrl??"",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(color: Colors.white,),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.white,
            ),
          ),

        ),            const SizedBox(
          height: 4,
        ),
        Text(
          model.name??"dar elbanat",
          style: const TextStyle(color: AppConstants.kPrimaryColor , fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}



class SubCategoryLoading extends StatelessWidget {
  const SubCategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40,) ,
        const BrowseAllLoading() ,
        SizedBox(
          height: screenHeight(context) * .15,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100, child:
                    const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,  // Background color
                    )) ,

                    const SizedBox(
                      height: 4,
                    ),
                    Shimmer.fromColors(baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100, child:
                    Container(
                      width: screenWidth(context)*.2,
                      height: 15,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4) ,
                        color: Colors.white ,
                      ),
                    )) ,
                  ],
                ),
              )
          ),
        ),
      ],
    );
  }
}
