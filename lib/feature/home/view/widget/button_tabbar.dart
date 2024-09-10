// import 'package:buttons_tabbar/buttons_tabbar.dart';
// import 'package:ecommercetemplate/core/utils/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class Categories extends StatefulWidget {
//
//   const Categories({super.key});
//
//   @override
//   State<Categories> createState() => _CategoriesState();
// }
//
// class _CategoriesState extends State<Categories> {
//   @override
//   Widget build(BuildContexat context) {
//     return BlocBuilder<CategoriesCubit , CategoriesState>(
//       builder: (context , state){
//         if(state is CategoriesStateSuccess){
//
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0),
//             child: DefaultTabController(
//               length: state.categories.length ,
//               child: ButtonsTabBar(
//                 contentCenter: true,
//                 // Customize the appearance and behavior of the tab bar
//                 backgroundColor: AppConstants.kPrimaryColor ,
//                 borderWidth: 0.2,
//                 height: 45,
//                 splashColor: Colors.transparent,
//                 contentPadding: const EdgeInsets.symmetric( horizontal: 24),
//                 unselectedBackgroundColor: Colors.transparent,
//
//
//                 labelStyle: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 unselectedLabelStyle: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 // Add your tabs here
//                 tabs: state.categories.map((item) => Tab(text: item)).toList(),
//               ),
//             ),
//           ) ;
//
//
//         }else{
//           return const SizedBox() ;
//         }
//       },
//     ) ;
//   }
// }
