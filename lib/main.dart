import 'package:dio/dio.dart';
import 'package:ecommercetemplate/core/router/app_router.dart';
import 'package:ecommercetemplate/core/service/api_service.dart';
import 'package:ecommercetemplate/core/service/single_ton.dart';
import 'package:ecommercetemplate/feature/home/controller/all_product_cubit.dart';
import 'package:ecommercetemplate/feature/home/controller/feature_product_cubit.dart';
import 'package:ecommercetemplate/feature/home/controller/main_categories_cubit.dart';
import 'package:ecommercetemplate/feature/home/controller/on_sale_cubit.dart';
import 'package:ecommercetemplate/feature/home/data/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/home/controller/sub_categories_cubit.dart';

void main() {
  setupSingleTon() ;
  runApp(const StoreShop());
}

class StoreShop extends StatelessWidget {
  const StoreShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> MainCategoriesCubit(getIt.get<HomeRepo>())..fetch() ),
        BlocProvider(create: (context)=> SubCategoriesCubit(getIt.get<HomeRepo>()) ),
        BlocProvider(create: (context)=> FeatureProductCubit(getIt.get<HomeRepo>()) ),
        BlocProvider(create: (context)=> OnSaleProductCubit(getIt.get<HomeRepo>()) ),
        BlocProvider(create: (context)=> AllProductCubit(getIt.get<HomeRepo>()) ),



      ],
      child: MaterialApp(
          theme: ThemeData(
splashColor: Colors.transparent,highlightColor: Colors.transparent,hoverColor: Colors.transparent,
            brightness: Brightness.light,

              appBarTheme: const AppBarTheme(
          )),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.homeScreen,
          routes: AppRouter.router),
    );
  }
}
