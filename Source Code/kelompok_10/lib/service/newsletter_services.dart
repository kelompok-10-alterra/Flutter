import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../model/news_letter_model.dart';
import '../theme/utils.dart';

class NewsLetterServices {
  Dio dio = Dio();

  Future<List<NewsLetterModel>> getAllNewsLetter(
    String token,
  ) async {
    String url = '$baseUrl/capstone/newsletter/userAccess/getAllNewsletter';
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (kDebugMode) {
        print(
          '\n\nNewsLetter Services : ${response.data} ${response.statusCode}\n\n');
      }

      final data = response.data;

      if (kDebugMode) {
        print('NewsLetter From data services : $data');
      }

      List<NewsLetterModel> newsLetterList = [];
      for (var i in data) {
        newsLetterList.add(NewsLetterModel.fromJson(i));
      }
      return newsLetterList;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
