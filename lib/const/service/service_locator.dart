
import 'package:buchi/data/data_source/remote_data_source.dart';
import 'package:buchi/data/repository/pets_repository.dart';
import 'package:buchi/domain/repository/base_pets_repository.dart';
import 'package:buchi/domain/usecases/get_pets_list.dart';
import 'package:buchi/presentation/controller/pets_bloc/pets_list_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/controller/live_data_filter_bloc/live_data_filter_bloc.dart';
GetIt  sLocator = GetIt.instance;

class ServicesLocator{
  void init(){

    // bloc
    sLocator.registerFactory(() => PetsListBloc(sLocator()));
    sLocator.registerFactory(() => LiveDataFilterBloc(sLocator()));
    //usecase
    sLocator.registerLazySingleton(() => GetPetsListUseCase(sLocator()));
    //repository
    sLocator.registerLazySingleton<BasePetsRepository>(() => PetsRepository(sLocator()));
    //datasource
    sLocator.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}