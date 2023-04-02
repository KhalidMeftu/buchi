import 'package:buchi/domain/repository/base_pets_repository.dart';

class GetPetsList{
  final BasePetsRepository repository;

  GetPetsList(this.repository);

  excute() async{
    return await repository.getPetsList();
  }

}