import 'package:buchi/domain/repository/base_pets_repository.dart';

import '../entity/pets.dart';

class GetPetsList{
  final BasePetsRepository repository;

  GetPetsList(this.repository);

  Future<List<Pets>>excute() async{
    return await repository.getPetsList();
  }

}