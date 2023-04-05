import 'package:buchi/data/data_source/remote_data_source.dart';
import 'package:buchi/domain/entity/pets.dart';
import 'package:buchi/domain/repository/base_pets_repository.dart';

class PetsRepository implements BasePetsRepository {
  final BaseRemoteDataSource baseremoteDataSource;

  PetsRepository(this.baseremoteDataSource);

  @override
  Future<List<Pets>> getPetsList() async {
    final result = await baseremoteDataSource.getPetsList();
    return result;
  }

  @override
   searchPets(List<String> selectedPets, bool gwc, String age,
      String gender, String size) async {
    // TODO: implement searchPets
    final result = await baseremoteDataSource.getSearchedPets(
        selectedPets, gwc, age, gender, size);
    return result;
  }
}
