import 'package:buchi/data/data_source/remote_data_source.dart';
import 'package:buchi/domain/entity/pets.dart';
import 'package:buchi/domain/repository/base_pets_repository.dart';

class PetsRepository implements BasePetsRepository{
  final BaseRemoteDataSource baseremoteDataSource;

  PetsRepository(this.baseremoteDataSource);
  //@override
  //Future<ListPets?> getPetsList() async{
   //return await baseremoteDataSource.getPetsList();
  //}



  @override
  Future<List<Pets>> getPetsList() async {
    final result = await baseremoteDataSource.getPetsList();
    return result;
  }

  @override
  Future<List<Pets>> searchPets(String val) {
    // TODO: implement searchPets
    throw UnimplementedError();
  }
  
}