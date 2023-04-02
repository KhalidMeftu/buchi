import 'package:buchi/presentation/widgets/pets_list_page.dart';
import 'package:buchi/presentation/widgets/shared/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../const/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _childern = [
    const PetsListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: petsAppBar()),
      body: _childern[_currentIndex],
      bottomNavigationBar: GNav(
        backgroundColor: AppColors.whiteColor,
        activeColor: AppColors.blackColor,
        color: AppColors.primaryColor,
        // unselected icon color
        gap: 8,
        //haptic: true, // haptic feedback
        tabs: const [
          GButton(
            icon: LineIcons.home,
            iconActiveColor: AppColors.primaryColor,
          ),
          //GButton(icon: LineIcons.search,text: AppStrings.search_page, iconActiveColor: AppColor.bottom_unselected,),
          //GButton(icon: LineIcons.heart,text: AppStrings.fav, iconActiveColor: AppColor.bottom_unselected,),
          //GButton(icon: LineIcons.user,text: AppStrings.about,iconActiveColor: AppColor.bottom_unselected,),
        ],
        onTabChange: (index) {
          onTabTapped(index);
        },
      ),
    );
  }

  void onTabTapped(int index) {
    // Error : setState method called after dispose()?
    if (!mounted) {
      return;
    }
    setState(() {
      _currentIndex = index;
    });
  }
}
