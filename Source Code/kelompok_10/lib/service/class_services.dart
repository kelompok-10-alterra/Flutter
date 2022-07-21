import 'package:dio/dio.dart';

import '../model/class_model.dart';
import '../theme/utils.dart';

class ClassServices {

  Dio dio = Dio();

  Future<List<ClassModel>> getAllClass(
    String token,
  ) async {
    String url =
        '$baseUrl/capstone/class/userAccess/getAllClass';
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print('\n\nClass Services : ${response.data} ${response.statusCode}\n\n');

      final data = response.data;

      print('Class From data services : $data');

      List<ClassModel> classList = [];
      for (var i in data) {
        classList.add(ClassModel.fromJson(i));
      }
      return classList;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ClassModel>> getClassByType(
    String typeName,
    String token,
  ) async {
    String url =
        '$baseUrl/capstone/class/userAccess/getClassByType?typeName=$typeName';
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print(
          '\n\nClass Services By Type : ${response.data} ${response.statusCode}\n\n');

      final data = response.data;

      print('Class Type From data services : $data');

      List<ClassModel> classList = [];
      for (var i in data) {
        classList.add(ClassModel.fromJson(i));
      }
      return classList;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
