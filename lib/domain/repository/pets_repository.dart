import '../entity/pets.dart';

abstract class PetsRepository{
  Future<Pets> getPetsList();
  Future<Pets> searchPets(String val);
}