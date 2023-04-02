import 'package:buchi/presentation/widgets/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/app_strings.dart';
import '../presentation/widgets/home_page/home_page.dart';
import '../presentation/widgets/search_page/searching_page/searching_Page.dart';

class Routes{
  static const String splashScreenRoute ='/';
  static const String homePageRoute ='/homepage';
  static const String searchPageRoute='/searchpage';
  static const String searchResultsRoute='/searchresultspage';
  static const String favouritePageRoute ='/favpage';
  static const String petdetailPageRoute='/detailspage';
  static const String adoptPageRoute='/adoptpage';
  static const String congratsPageRoute='/congratspage';


}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){


    switch(routeSettings.name)
    {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_)=> const SplashScreen());

      case Routes.homePageRoute:
        return MaterialPageRoute(builder: (_)=> const HomePage());
        
      //case Routes.searchPageRoute:
       // return MaterialPageRoute(builder: (_)=>  SearchingPage(isDog:isdog, isCat: iscat, isOther: isother,));



      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
        Scaffold(
          appBar: AppBar(title: const Text(AppStrings.norouteFound),),
          body: const Center(child: Text(AppStrings.norouteFound),),
        )
    );
  }
}