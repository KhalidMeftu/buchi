import 'package:bloc/bloc.dart';
import 'package:buchi/presentation/controller/local_database_bloc/pets_event.dart';
import 'package:buchi/presentation/controller/local_database_bloc/pets_state.dart';
import '../../../local_database/dao.dart';


class PetsLocalDbBloc extends Bloc<PetsLocalDbEvent, PetsLocalDbState> {
  final PetsDAO _petsDAO = PetsDAO();

  PetsLocalDbBloc() : super(PetsInitial()) {
    on<LoadPetsWithSearch>((event, emit) async {
      emit(LocalDbPetsLoading());
      final petsResponse = await _petsDAO
          .searchLocalDatabase(event.selectedPets, event.gwc, event.age,
              event.gender, event.size)
          .whenComplete(() {});

      if (petsResponse == null || petsResponse.toString() == '[]') {
        emit(PetsLocalDbEmpty());
      } else {
        emit(PetsLocalDBLoaded(petsResponse));
      }
    });

    on<LoadPets>((event, emit) async {
      // TODO: implement event handler
      emit(LocalDbPetsLoading());
      final fruits = await _petsDAO.getPetslSortedByName().whenComplete(() {});

      emit(PetsLocalDBLoaded(fruits));
      // Yielding a state bundled with the Fruits from the database.
    });
  }
}
