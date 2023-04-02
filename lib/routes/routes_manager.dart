import 'package:buchi/presentation/widgets/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/app_strings.dart';
import '../presentation/widgets/home_page.dart';

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