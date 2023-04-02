import '../entity/pets.dart';

abstract class BasePetsRepository{
  Future<Pets?> getPetsList();
  Future<Pets?> searchPets(String val);
}