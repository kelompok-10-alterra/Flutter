import 'package:dio/dio.dart';

import '../model/type_model.dart';

class TypeServices {
  String baseUrl = 'https://api.rafdev.my.id';

  Dio dio = Dio();

  //Get all type
  Future<List<TypeModel>> getAllType(
    String token,
  ) async {
    String url = '$baseUrl/capstone/type/userAccess/getAllType';
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print('Type Services : ${response.data} ${response.statusCode}');

      final data = response.data;

      print('Type From data services : $data');

      List<TypeModel> type = [];
      for (var i in data) {
        type.add(TypeModel.fromJson(i));
      }
      return type;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
