import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buchi/data/data_source/remote_data_source.dart';
import 'package:buchi/domain/repository/base_pets_repository.dart';
import 'package:buchi/domain/usecases/get_pets_list.dart';
import 'package:equatable/equatable.dart';
import '../../../const/enums.dart';
import '../../../data/repository/pets_repository.dart';
import '../../../domain/entity/pets.dart';

part 'pets_list_event.dart';
part 'pets_list_state.dart';

class PetsListBloc extends Bloc<PetsListEvent, PetsListState> {
  final GetPetsListUseCase getPetsListUseCase;
  PetsListBloc(this.getPetsListUseCase) : super(PetsListInitial()) {
    on<GetPetsListEvent>((event, emit) async {
      print('Bloc intialized');
     // BaseRemoteDataSource  baseRemoteDataSource = RemoteDataSource();
      //BasePetsRepository repository = PetsRepository(baseRemoteDataSource);
      final result= await getPetsListUseCase.excute();
      print(result);

      // emit value

    });
  }
}
