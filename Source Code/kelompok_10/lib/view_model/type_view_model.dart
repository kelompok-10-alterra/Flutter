// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../model/type_model.dart';
import '../service/type_services.dart';

enum TypeState { none, loading, hashdata, error }

class TypeViewModel extends ChangeNotifier {
  List<TypeModel> _type = [];
  List<TypeModel> get type => _type;

  String? _message;
  String get message => _message!;

  TypeState _state = TypeState.none;
  TypeState get state => _state;

  Future<List<TypeModel>> getAllType(
    String token,
  ) async {
    _state = TypeState.loading;
    notifyListeners();
    try {
      final List<TypeModel> data = await TypeServices().getAllType(
        token,
      );
      _type = data;
      _state = TypeState.hashdata;
      notifyListeners();

      print('Type From data provider : $data');
      return data;
    } catch (e) {
      _message = e.toString();
      _state = TypeState.error;
      notifyListeners();
      return [];
    }
  }
}
