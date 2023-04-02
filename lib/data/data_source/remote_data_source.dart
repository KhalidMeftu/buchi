import 'dart:convert';

import 'package:buchi/const/app_service.dart';
import 'package:buchi/data/model/pets_model.dart';
import 'package:dio/dio.dart';

import '../../domain/entity/pets.dart';

abstract class BaseRemoteDataSource{
  Future<List<Pets>> getPetsList();
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<List<Pets>> getPetsList() async{
    try{
      var response = await Dio().get('${AppService.baseUrl}?limit=100');
      print(response);

      if(response.statusCode==200)
        {
          return List<Pets>.from((response.data['pets'] as List).map((e) => PetsModel.fromJson(e)));
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