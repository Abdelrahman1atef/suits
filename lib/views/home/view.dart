import 'package:flutter/material.dart';
import 'package:suits/views/home/pages/cart.dart';
import 'package:suits/views/home/pages/fav.dart';
import 'package:suits/views/home/pages/home/home.dart';
import 'package:suits/views/home/pages/profile.dart';

import '../../../core/widgets/app_Image.dart';
import '../../../core/widgets/app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final screens = [
    const HomePage(),
    const CartPage(),
    const FavPage(),
    const ProfilePage(),
  ];
  int currentScreen = 0;
  late String title;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        haveTitle: true,
        haveSearchBar: false,
        centerTitle: currentScreen == 0 ? false : true,
        title: currentScreen == 0
            ? "Hello Safia"
            : currentScreen == 1
            ? "My Cart"
            : currentScreen == 2
            ? "Favourites"
            : "Profile",
        textStyle: currentScreen != 0
            ? null
            : theme.textTheme.titleMedium?.copyWith(
                fontSize: 25,
                fontVariations: [const FontVariation("wght", 700)],
              ),
      ),
      body: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: IndexedStack(index: currentScreen, children: screens),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color(0xFFF9F9F9)),
        child: BottomNavigationBarTheme(
          data: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            enableFeedback: false,
          ),
          child: BottomNavigationBar(
            currentIndex: currentScreen,
            onTap: (value) {
              setState(() {
                currentScreen = value;
              });
            },

            items: const [
              BottomNavigationBarItem(
                icon: AppImage(image: "unselected_home.svg", width: 24),
                activeIcon: AppImage(image: "selected_home.svg", width: 24),
                tooltip: "Home",
                label: "",
              ),
              BottomNavigationBarItem(
                icon: AppImage(image: "unselected_cart.svg", width: 24),
                activeIcon: AppImage(image: "selected_cart.svg", width: 24),
                tooltip: "Cart",
                label: "",
              ),
              BottomNavigationBarItem(
                icon: AppImage(image: "unselected_fav.svg", width: 24),
                activeIcon: AppImage(image: "selected_fav.svg", width: 24),
                tooltip: "Favourites",
                label: "",
              ),
              BottomNavigationBarItem(
                icon: AppImage(image: "unselected_profile.svg", width: 24),
                activeIcon: AppImage(image: "selected_profile.svg", width: 24),
                tooltip: "Profile",
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
