import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:e_commerce_app/src/common/constants/app_theme.dart';
import 'package:e_commerce_app/src/feature/widget/clothes_menu/clothes_grid.dart';
import 'package:e_commerce_app/src/feature/widget/cart/cart_screen.dart';
import 'package:e_commerce_app/src/feature/widget/profile/profile_screen.dart';
import 'package:e_commerce_app/src/feature/widget/search/search_screen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ClothesGridScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  List<GButton> tabs(context) {
    return [
      GButton(
        icon: Icons.home_rounded,
        text: AppLocalizations.of(context)!.main,
      ),
      GButton(
        icon: Icons.search_rounded,
        text: AppLocalizations.of(context)!.search,
      ),
      GButton(
        icon: Icons.bookmark,
        text: AppLocalizations.of(context)!.bookmarks,
      ),
      GButton(
        icon: Icons.account_circle_rounded,
        text: AppLocalizations.of(context)!.profile,
      ),
    ];
  }

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: GNav(
        haptic: true,
        tabBorderRadius: 15,
        duration: const Duration(milliseconds: 250),
        gap: 10,
        iconSize: 30,
        color: AppConstants.kDefaultTextColor,
        style: GnavStyle.google,
        activeColor: AppConstants.kDefaultAppColor0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        tabs: tabs(context),
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
