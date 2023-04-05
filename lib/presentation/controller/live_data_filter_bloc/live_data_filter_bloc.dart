import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/pets.dart';
import '../../../domain/usecases/get_pets_list.dart';

part 'live_data_filter_event.dart';
part 'live_data_filter_state.dart';

class LiveDataFilterBloc extends Bloc<LiveDataFilterEvent, LiveDataFilterState> {
  final GetPetsListUseCase getPetsListUseCase;

  LiveDataFilterBloc(this.getPetsListUseCase) : super(LiveDataFilterInitial()) {
    on<FilterListEvent>((event, emit) async {
      // TODO: implement event handler
      emit(LiveDataFilterLoading());

      print('Selected Pet is');
      print(event.selectedPets[0]);
      final result= await getPetsListUseCase.excuteSearch(event.selectedPets, event.gwc,
          event.age, event.gender, event.size);

      /// check if result is empty
      ///

      print(result);
      if (result.toString() == '[]' && result == null) {
        emit(LiveDataResponseEmpty());
      } else {
        emit(LiveDataFilterd(result));
      }


      //emit(LiveDataFilterd(result));
    });
  }
}
