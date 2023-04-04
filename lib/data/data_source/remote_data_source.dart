import 'package:buchi/const/app_service.dart';
import 'package:buchi/data/model/pets_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entity/pets.dart';
import '../../local_database/dao.dart';

abstract class BaseRemoteDataSource {
  Future<List<Pets>> getPetsList();

  Future<List<Pets>> getSearchedPets(List<String> selectedPets, bool gwc, String age, String gender, String size);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<List<Pets>> getPetsList() async {
    try {
      var response = await Dio().get('${AppService.baseUrl}?limit=100');
      if (response.statusCode == 200) {
        (response.data['pets'] as List).map((e) async {
          try {
            final PetsDAO pestDao = PetsDAO();

            pestDao.insert(PetsModel.fromJson(e));
          } catch (e) {
            if (kDebugMode) {
              print('DB exception $e');
            }
          }
        }).toList();

        return List<Pets>.from((response.data['pets'] as List).map((e) {
          return PetsModel.fromJson(e);
        }));
      } else {
        return response.data;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception$e');
      }

      rethrow;
    }
  }

  @override
  Future<List<Pets>> getSearchedPets(List<String> selectedPets, bool gwc, String age, String gender, String size) async {
    try {
      var response = await Dio().get('${AppService.baseUrl}?limit=300');
      if (response.statusCode == 200) {
       /// implement all filter logic here

        return List<Pets>.from((response.data['pets'] as List).map((e) {
          return PetsModel.fromJson(e);
        }));
      } else {
        return response.data;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception$e');
      }

      rethrow;
    }
  }

}
