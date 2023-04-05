import 'package:buchi/domain/repository/base_pets_repository.dart';

import '../entity/pets.dart';

class GetPetsListUseCase{
  final BasePetsRepository repository;

  GetPetsListUseCase(this.repository);

  Future<List<Pets>>excute() async{
    return await repository.getPetsList();
  }

   excuteSearch(List<String> selectedPets, bool gwc, String age, String gender, String size) async{
    return await repository.searchPets(selectedPets,gwc,age,gender,size);
  }

}