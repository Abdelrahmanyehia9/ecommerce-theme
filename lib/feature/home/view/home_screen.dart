import 'package:ecommercetemplate/feature/home/view/main_categories.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../core/utils/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> bodyPages = [
    const MainCategories(),
    const DummyScreen(label: "like"),
    const DummyScreen(
      label: "search",
    ),
    const DummyScreen(
      label: "profile",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GNav(
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: AppConstants.kPrimaryColor,
          rippleColor: Colors.grey,
          haptic: true,
          tabBorderRadius: 12,
          curve: Curves.bounceIn,
          duration: const Duration(milliseconds: 400),
          gap: 8,
          tabMargin: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.white70,
          activeColor: Colors.white,
          iconSize: 24,
          tabBackgroundColor: Colors.grey.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          tabs: const [
            GButton(icon: Icons.home_outlined, text: 'Home'),
            GButton(icon: Icons.favorite_outline, text: 'Likes'),
            GButton(icon: Icons.search, text: 'Search'),
            GButton(icon: Icons.person_outline, text: 'Profile')
          ],
        ),
        body: bodyPages[_selectedIndex]);
  }
}

// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// filterProduct(context),
// const Categories(),
// Expanded(
// child: BlocBuilder<HomeCubit, HomeState>(
// builder: (context, state) {
// final pagingController = BlocProvider.of<HomeCubit>(context).pagingController;
//
// if (pagingController.error != null) {
// return Center(child: Text("Oops, there was an error"));
// } else {
// return PagedGridView<int, ProductModel>(
// pagingController: pagingController,
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 8,
// crossAxisSpacing: 8,
// childAspectRatio: 0.65,
// ),
// builderDelegate: PagedChildBuilderDelegate<ProductModel>(
// animateTransitions: true,
// itemBuilder: (context, product, index) => ProductItem(model: product),
// ),
// );
// }
// },
// ),
// ),
// ],
// ),
// ),

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(label),
    );
  }
}
