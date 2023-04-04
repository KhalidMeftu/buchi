import 'package:buchi/presentation/controller/local_database_bloc/pets_bloc.dart';
import 'package:buchi/presentation/controller/network_bloc/network_connectivity_bloc.dart';
import 'package:buchi/presentation/controller/pets_bloc/pets_list_bloc.dart';
import 'package:buchi/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'const/service/service_locator.dart';

void main() async {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PetsLocalDbBloc(),
          ),
          BlocProvider(
              create: (context) =>
                  NetworkConnectivityBloc()..add(CheckNetwork())),
          BlocProvider(
              create: (context) =>
                  PetsListBloc(sLocator())..add(GetPetsListEvent())),
        ],
        child: MaterialApp(
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashScreenRoute,
          //title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.brown,
          ),
          //home: const SplashScreen() //const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}
