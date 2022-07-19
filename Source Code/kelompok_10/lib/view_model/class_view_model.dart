import 'package:flutter/widgets.dart';

import '../model/class_model.dart';
import '../service/class_services.dart';

enum ClassState { none, loading, hashdata, error }

class ClassViewModel extends ChangeNotifier {
  List<ClassModel> _classData = [];
  List<ClassModel> get classData => _classData;

  String? _message;
  String get message => _message!;

  ClassState _state = ClassState.none;
  ClassState get state => _state;

  Future<List<ClassModel>> getAllClass() async {
    _state = ClassState.loading;
    notifyListeners();
    try {
      final List<ClassModel> data = await ClassServices().getAllClass();
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
}
