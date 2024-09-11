import "package:cached_network_image/cached_network_image.dart";
import "package:ecommercetemplate/core/utils/app_constants.dart";
import "package:ecommercetemplate/core/utils/dimentions.dart";
import "package:ecommercetemplate/feature/home/controller/main_categories_cubit.dart";
import "package:ecommercetemplate/feature/home/controller/main_categories_state.dart";
import "package:ecommercetemplate/feature/home/data/model/category_model.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "../../../core/widgets/error_loading.dart";
import "home_v2.dart";

class MainCategories extends StatelessWidget {
  const MainCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<MainCategoriesCubit, MainCategoriesState>(
      builder: (context, state) {
        if (state is MainCategoriesStateFailure) {
          return const ErrorLoading(errorLabel: "reach this page") ;
        } else if (state is MainCategoriesStateSuccess) {
          List<CategoryModel> filteredCategories = state.categories
              .where((category) => category.count != 0)
              .toList();
          filteredCategories.sort((a, b) => b.count!.compareTo(a.count!) ,);
          filteredCategories.reversed.toList() ;

          return ListView.builder(
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> HomeScreenV2(id: filteredCategories[index].id)   )) ;
                    },
                    child: categoryItem(context, filteredCategories[index]));
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppConstants.kPrimaryColor,),
          );
        }
      },
    ));
  }

  Widget categoryItem(BuildContext context, CategoryModel model) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          width: double.infinity,
          height: screenHeight(context) * 0.2,

          decoration: BoxDecoration(

            image: DecorationImage(image: CachedNetworkImageProvider(model.imgUrl??"https://daralbanat.com/wp-content/uploads/2024/02/logo-gif-1.gif") , fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(12),


          ),

        ),
        Container(
          width: double.infinity,
      height: screenHeight(context)*.2,
decoration: BoxDecoration(
   gradient: LinearGradient(
colors: [Colors.black.withOpacity(0.75), Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                model.name ?? "",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,

                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${model.count} products" ?? "",
                style: TextStyle(color: Colors.grey.shade200, fontSize: 14 ,

                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );}
