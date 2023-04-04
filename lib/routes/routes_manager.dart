import 'package:flutter/material.dart';

import '../const/app_strings.dart';
import '../presentation/widgets/congrats_page/congrats_page.dart';
import '../presentation/widgets/detail_screen/detail_screen_page.dart';
import '../presentation/widgets/home_page/home_page.dart';
import '../presentation/widgets/search_page/search_results_page.dart';
import '../presentation/widgets/search_page/searching_page/searching_Page.dart';
import '../presentation/widgets/splash_detail/splash_screen.dart';

class Routes {
  static const String splashScreenRoute = '/';
  static const String homePageRoute = '/homepage';
  static const String searchPageRoute = '/searchpage';
  static const String searchResultsRoute = '/searchresultspage';
  static const String favouritePageRoute = '/favpage';
  static const String petdetailPageRoute = '/detailspage';
  static const String adoptPageRoute = '/adoptpage';
  static const String congratsPageRoute = '/congratspage';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.homePageRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.searchPageRoute:
        List<dynamic> args = routeSettings.arguments as List<dynamic>;
        return MaterialPageRoute(
            builder: (_) => SearchingPage(
                  isSearchingDog: args[0],
                  isSearchingCat: args[1],
                  isSearchingOther: args[2],
                ));

      case Routes.searchResultsRoute:
        List<dynamic> args = routeSettings.arguments as List<dynamic>;
        return MaterialPageRoute(
            builder: (_) => SearchResultsPage(
                pets: args[0],
                goodWithChildrenSelected: args[1],
                ageSelected: args[2],
                genderSelected: args[3],
                sizeSelected: args[4], canCheckWeb: args[5],));

      case Routes.petdetailPageRoute:
        List<dynamic> args = routeSettings.arguments as List<dynamic>;
        return MaterialPageRoute(
            builder: (_) => DetailScreenPage(
                  type: args[0],
                  notGoodWChildren: args[1],
                  age: args[2],
                  gender: args[3],
                  size: args[4],
                  imageList: args[5],
                ));
      case Routes.congratsPageRoute:
        return MaterialPageRoute(builder: (_) => const CongratsPage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.norouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.norouteFound),
              ),
            ));
  }
}
