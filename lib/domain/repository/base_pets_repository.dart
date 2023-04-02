import '../entity/pets.dart';

abstract class BasePetsRepository{
  Future<List<Pets>> getPetsList();
  Future<List<Pets>> searchPets(String val);
}