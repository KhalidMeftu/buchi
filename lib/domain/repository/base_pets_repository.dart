import '../entity/pets.dart';

abstract class BasePetsRepository{
  Future<List<Pets>> getPetsList();
  Future<List<Pets>> searchPets(
   List<String> selectedPets,
   bool gwc,
   String age,
   String gender,
   String size,
   );
}