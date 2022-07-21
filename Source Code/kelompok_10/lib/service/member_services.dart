// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:kelompok_10/model/member_model.dart';
import '../theme/utils.dart';

class MemberServices {
  Dio dio = Dio();

  //getAllMember

  Future<List<MemberModel>> getAllMember(
    String token,
  ) async {
    String url = '$baseUrl/capstone/member/userAccess/getAllMember';
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print(
          '\n\nMember Services : ${response.data} ${response.statusCode}\n\n');

      final data = response.data;

      print('Member From data services : $data');

      List<MemberModel> memberList = [];
      for (var i in data) {
        memberList.add(MemberModel.fromJson(i));
      }
      return memberList;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<String> buyMember(
    int userId,
    int memberId,
    int total,
    String method,
    String token,
  ) async {
    String url = '$baseUrl/capstone/membership/userAccess/buyMembership';
    try {
      Response response = await dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'userId': userId,
          'memberId': memberId,
          'total': total,
          'method': method,
        },
      );
      print(
          '\n\nMember Services : ${response.data} ${response.statusCode}\n\n');
      final data = response.data.toString();
      print('Member From data services : $data');
      return data;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
