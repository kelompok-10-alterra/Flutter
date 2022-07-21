import 'package:flutter/widgets.dart';

import '../model/class_model.dart';
import '../service/class_services.dart';

enum ClassState { none, loading, hashdata, error }

class ClassViewModel extends ChangeNotifier {
  List<ClassModel> _classData = [];
  List<ClassModel> get classData => _classData;

  List<ClassModel> _classCategory = [];
  List<ClassModel> get classCategory => _classCategory;

  String? _message;
  String get message => _message!;

  ClassState _state = ClassState.none;
  ClassState get state => _state;

  Future<List<ClassModel>> getAllClass(
    String token,
  ) async {
    _state = ClassState.loading;
    notifyListeners();
    try {
      final List<ClassModel> data = await ClassServices().getAllClass(token);

      _classData = data;
      _state = ClassState.hashdata;
      notifyListeners();

      print('Class From data provider : $data');
      return data;
    } catch (e) {
      _message = e.toString();
      _state = ClassState.error;
      notifyListeners();
      return [];
    }
  }

  Future<List<ClassModel>> getClassByType(
    String typeName,
    String token,
  ) async {
    _state = ClassState.loading;
    notifyListeners();
    try {
      final List<ClassModel> data =
          await ClassServices().getClassByType(typeName, token);

      _classData = data;
      _state = ClassState.hashdata;
      notifyListeners();

      print('Class Type From data provider : $data');
      return data;
    } catch (e) {
      _message = e.toString();
      _state = ClassState.error;
      notifyListeners();
      return [];
    }
  }

  Future<List<ClassModel>> getClassByCategory(
    String categoryName,
  ) async {
    _classCategory.clear();
    _state = ClassState.loading;
    notifyListeners();

    try {
      final List<ClassModel> data = _classData
          .where((element) => element.categoryName == categoryName)
          .toList();

      _classCategory = data;
      _state = ClassState.hashdata;
      notifyListeners();

      print('Class Category From data provider : $data');
      return data;
    } catch (e) {
      _message = e.toString();
      _state = ClassState.error;
      notifyListeners();
      return [];
    }
  }
}
