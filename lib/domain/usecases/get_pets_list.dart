import 'package:buchi/domain/repository/pets_repository.dart';

class GetPetsList{
  final PetsRepository repository;

  GetPetsList(this.repository);

  excute() async{
    return await repository.getPetsList();
  }

}