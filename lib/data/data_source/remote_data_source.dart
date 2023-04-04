import 'dart:convert';
import 'package:buchi/const/app_service.dart';
import 'package:buchi/data/model/pets_model.dart';
import 'package:dio/dio.dart';
import '../../domain/entity/pets.dart';
import '../../local_database/dao.dart';

abstract class BaseRemoteDataSource{
  Future<List<Pets>> getPetsList();
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<List<Pets>> getPetsList() async{
    try{
      var response = await Dio().get('${AppService.baseUrl}?limit=100');
      ///print(response);

      if(response.statusCode==200)
        {
            /// var fruit = TestModel( name: "Apple", isSweet: true, leaves: leavesList);
          //       _fruitDao.insert(fruit);
           (response.data['pets'] as List).map((e) async {
             try
             {
               print('Before$e');
               //await DBProvider.db.createPets(Pet.fromJson(e));
               final PetsDAO _fruitDao = PetsDAO();

               _fruitDao.insert(PetsModel.fromJson(e));
               print('Successfully inserted');

             }
             catch(e)
             {
               print('DB exception $e');
             }

           }).toList();


          return List<Pets>.from((response.data['pets'] as List).map((e) {
            //await DBProvider.db.createPets(Petlist.fromJson(e));

          return PetsModel.fromJson(e);
          }


        ));
        }
      else{
        return response.data;
      }
    }catch(e){
      print(e);
      //return null;
      throw e;
    }


  }

}