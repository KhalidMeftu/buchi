import 'package:buchi/presentation/controller/live_data_filter_bloc/live_data_filter_bloc.dart';
import 'package:buchi/presentation/controller/local_database_bloc/pets_bloc.dart';
import 'package:buchi/presentation/controller/network_bloc/internet_bloc.dart';
import 'package:buchi/presentation/controller/pets_bloc/pets_list_bloc.dart';
import 'package:buchi/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'const/service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(
  DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(), // Wrap your app
  ));
 // r//unApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => InternetBloc()),
          BlocProvider(
            create: (context) => PetsLocalDbBloc(),
          ),
          BlocProvider(
              create: (context) =>
                  PetsListBloc(sLocator())..add(GetPetsListEvent())),
          BlocProvider(
            create: (context) => LiveDataFilterBloc(sLocator()),
          ),
        ],
        child: MaterialApp(
          useInheritedMediaQuery: true,
          //locale: DevicePreview.locale(context),
          //builder: DevicePreview.appBuilder,
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
