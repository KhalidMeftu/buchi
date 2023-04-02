import 'dart:convert';

import 'package:buchi/const/app_service.dart';
import 'package:buchi/data/model/pets_model.dart';
import 'package:dio/dio.dart';

import '../../domain/entity/pets.dart';

abstract class BaseRemoteDataSource{
  Future<Pets?> getPetsList();
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<Pets?> getPetsList() async{
    try{
      var response = await Dio().get('${AppService.baseUrl}?limit=100');
      print(response);

      return PetsModel.fromJson(response.data);
    }catch(e){
      print(e);
      return null;
    }


  }

}