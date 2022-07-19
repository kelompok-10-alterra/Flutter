import 'package:dio/dio.dart';

import '../model/class_model.dart';

class ClassServices {
  String baseUrl = 'https://api.rafdev.my.id';

  Dio dio = Dio();

  Future<List<ClassModel>> getAllClass() async {
    String url =
        '$baseUrl/capstone/class/userAccess/getAllClass?keyword=string';
    try {
      Response response = await dio.get(
        url,
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
}
