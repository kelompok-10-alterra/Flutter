import 'package:flutter/widgets.dart';

import '../model/news_letter_model.dart';
import '../service/newsletter_services.dart';

enum NewsLetterState {
  none,
  loading,
  hashData,
  isEmpty,
  error,
}

class NewsLetterViewModel extends ChangeNotifier {
  List<NewsLetterModel> _newsLatterData = [];
  List<NewsLetterModel> get newsLatterData => _newsLatterData;

  NewsLetterState _state = NewsLetterState.none;
  NewsLetterState get state => _state;

  Future<List<NewsLetterModel>> getAllNewsLetters(
    String token,
  ) async {
    _state = NewsLetterState.loading;
    notifyListeners();
    try {
      final List<NewsLetterModel> data =
          await NewsLetterServices().getAllNewsLetter(token);

      _newsLatterData = data;
      _state = NewsLetterState.hashData;
      notifyListeners();

      print('NewsLetter From data provider : $data');
      return data;
    } catch (e) {
      _state = NewsLetterState.error;
      notifyListeners();
      return [];
    }
  }
}
