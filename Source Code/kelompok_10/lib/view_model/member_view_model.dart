import 'package:flutter/cupertino.dart';
import 'package:kelompok_10/model/member_model.dart';

import '../service/member_services.dart';

enum MemberState { none, loading, hashdata, error, isEmpty }

class MemberViewModel extends ChangeNotifier {
  List<MemberModel> _memberData = [];
  List<MemberModel> get memberData => _memberData;

  String _buyResponse = 'null';
  String get buyResponse => _buyResponse;

  String? _message;
  String get message => _message!;

  MemberState _state = MemberState.none;
  MemberState get state => _state;

  Future<List<MemberModel>> getAllMember(String token) async {
    _state = MemberState.loading;
    notifyListeners();
    try {
      final List<MemberModel> data = await MemberServices().getAllMember(token);

      if (data.isEmpty) {
        _state = MemberState.isEmpty;
        notifyListeners();
      }

      _memberData = data;
      _state = MemberState.hashdata;
      notifyListeners();

      print('Member From data provider : $data');
      return data;
    } catch (e) {
      _message = e.toString();
      _state = MemberState.error;
      notifyListeners();
      return [];
    }
  }

  //buyMember
  Future<String> buyMember(
    int userId,
    int memberId,
    int total,
    String method,
    String token,
  ) async {
    _state = MemberState.loading;
    notifyListeners();
    try {
      final String data = await MemberServices().buyMember(
        userId,
        memberId,
        total,
        method,
        token,
      );

      _buyResponse = data;
      _state = MemberState.hashdata;
      notifyListeners();
      return data;
    } catch (e) {
      _message = e.toString();
      _state = MemberState.error;
      notifyListeners();
      return '';
    }
  }
}
