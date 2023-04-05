import 'package:buchi/const/app_service.dart';
import 'package:buchi/data/model/pets_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/service/service_locator.dart';
import '../../domain/entity/pets.dart';
import '../../local_database/dao.dart';
import '../../shared_prefrences_database/shared_prefs_services.dart';

abstract class BaseRemoteDataSource {
  Future<List<Pets>> getPetsList();

  Future getSearchedPets(List<String> selectedPets, bool gwc, String age,
      String gender, String size);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<List<Pets>> getPetsList() async {
    try {
      var response = await Dio().get('${AppService.baseUrl}?limit=100');
      if (response.statusCode == 200) {
        var storageService = sLocator<LocalStorageServices>();
        var downloadStatus = storageService.getDownloadStatus();

        if (downloadStatus == null) {
          (response.data['pets'] as List).map((e) async {
            try {
              /// check if we download first from sharedprefs
              final PetsDAO pestDao = PetsDAO();
              pestDao.insert(PetsModel.fromJson(e));
              var preferences = await SharedPreferences.getInstance();
              preferences.setString('status', 'downloaded');
            } catch (e) {
              if (kDebugMode) {
                print('exception $e');
              }
            }
          }).toList();
        } else if (downloadStatus.toString().isNotEmpty) {}

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
  Future getSearchedPets(List<String> selectedPets, bool gwc, String age,
      String gender, String size) async {
    try {
      /// get queries
      Map<String, dynamic> queryParameters = {};
      if (selectedPets.toString() == '[]') {
        /// type is null
        if (age.isEmpty && gender.isEmpty && size.isEmpty) {
          //queryParameters['type']=selectedPets[0].toString();
        }
        if (age.isNotEmpty && gender.isNotEmpty && size.isNotEmpty) {
          //queryParameters['type']=selectedPets[0].toString();
          queryParameters['limit'] = 100;
          queryParameters['age'] = age;
          queryParameters['gender'] = gender;
          queryParameters['size'] = size;
        }
        if (size.isEmpty && age.isNotEmpty && gender.isEmpty) {
          // queryParameters['type']=selectedPets[0].toString();
          queryParameters['limit'] = 100;
          queryParameters['age'] = age;
        }
        if (size.isNotEmpty && age.isEmpty && gender.isEmpty) {
          //queryParameters['type']=selectedPets[0].toString();
          queryParameters['limit'] = 100;
          queryParameters['size'] = size;
        }

        if (size.isEmpty && age.isEmpty && gender.isNotEmpty) {
          //queryParameters['type']=selectedPets[0].toString();
          queryParameters['limit'] = 100;
          queryParameters['gender'] = gender;
        }
      } else if (selectedPets.toString() != '[]') {
        /// type is null and only single value is allowed
        if (age.isEmpty && gender.isEmpty && size.isEmpty) {
          queryParameters['limit'] = 100;
          queryParameters['type'] = selectedPets[0].toString();
        }
        if (age.isNotEmpty && gender.isNotEmpty && size.isNotEmpty) {
          queryParameters['limit'] = 100;
          queryParameters['type'] = selectedPets[0].toString();
          queryParameters['age'] = age;
          queryParameters['gender'] = gender;
          queryParameters['size'] = size;
        }
        if (size.isEmpty && age.isNotEmpty && gender.isEmpty) {
          queryParameters['limit'] = 100;
          queryParameters['type'] = selectedPets[0].toString();
          queryParameters['age'] = age;
        }
        if (size.isNotEmpty && age.isEmpty && gender.isEmpty) {
          queryParameters['limit'] = 100;
          queryParameters['type'] = selectedPets[0].toString();
          queryParameters['size'] = size;
        }
        if (size.isEmpty && age.isEmpty && gender.isNotEmpty) {
          queryParameters['limit'] = 100;
          queryParameters['type'] = selectedPets[0].toString();
          queryParameters['gender'] = gender;
        }
      }
      var _dio = Dio();
      var options = Options();
      options.contentType = 'application/json';
      String url = AppService.baseUrl;

      var response = await _dio.get(url,
          options: options, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        /// implement all filter logic here

        return List<Pets>.from(
            (response.data['pets'] as List).map((e) => PetsModel.fromJson(e)));
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
