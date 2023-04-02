import '../../domain/entity/pets.dart';

abstract class BaseRemoteDataSource{
  Future<Pets> getPetsList();
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<Pets> getPetsList() {
    // TODO: implement getPetsList
    throw UnimplementedError();
  }

}