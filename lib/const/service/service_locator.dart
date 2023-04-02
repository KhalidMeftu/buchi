
import 'package:buchi/data/data_source/remote_data_source.dart';
import 'package:buchi/data/repository/pets_repository.dart';
import 'package:buchi/domain/repository/base_pets_repository.dart';
import 'package:buchi/domain/usecases/get_pets_list.dart';
import 'package:buchi/presentation/controller/pets_bloc/pets_list_bloc.dart';
import 'package:get_it/get_it.dart';
GetIt  sLocator = GetIt.instance;

class ServicesLocator{
  void init(){

    // bloc
    sLocator.registerFactory(() => PetsListBloc(sLocator()));
    //usecase
    sLocator.registerLazySingleton(() => GetPetsListUseCase(sLocator()));
    //repository
    sLocator.registerLazySingleton<BasePetsRepository>(() => PetsRepository(sLocator()));
    //datasource
    sLocator.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}