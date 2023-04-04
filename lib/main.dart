import 'package:buchi/presentation/controller/local_database_bloc/pets_bloc.dart';
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
    return
      BlocProvider(
        create: (context) => PetsLocalDbBloc(),
        child: MaterialApp(
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashScreenRoute,
          //title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.brown,
          ),
          //home: const SplashScreen() //const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      );
  }
}

