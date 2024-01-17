import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/navigation_item.dart';
import 'package:plant_app/ui/screen/cart/cart_screen.dart';
import 'package:plant_app/ui/screen/favorite/favorite_screen.dart';
import 'package:plant_app/ui/screen/home/home_screen.dart';
import 'package:plant_app/ui/screen/profile/profile_screen.dart';
import 'package:plant_app/ui/screen/scan/scan_page.dart';
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomNavIndex = 0;

  List<NavigationItem> navigationItems = const [
    NavigationItem(
      title: 'Home',
      icon: Icons.home,
      page: HomeScreen(),
    ),
    NavigationItem(
      title: 'Favorite',
      icon: Icons.favorite,
      page: FavoriteScreen(),
    ),
    NavigationItem(
      title: 'Cart',
      icon: Icons.shopping_cart,
      page: CartScreen(),
    ),
    NavigationItem(
      title: 'Profile',
      icon: Icons.person,
      page: ProfileScreen(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              navigationItems[bottomNavIndex].title,
              style: const TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.notifications,
                size: 30,
                color: Constants.blackColor,
              ),
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: bottomNavIndex,
        children: navigationItems.map((e) => e.page).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.primaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const ScanPage(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(0.5),
        icons: navigationItems.map((e) => e.icon).toList(),
        activeIndex: bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
