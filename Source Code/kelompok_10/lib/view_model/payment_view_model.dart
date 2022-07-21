import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kelompok_10/model/payment_method_model.dart';
import 'package:uuid/uuid.dart';

import '../service/member_services.dart';

enum PaymentState { none, loading, hashdata, error, isEmpty }

class PaymentViewModel extends ChangeNotifier {
  PaymentViewsModel _paymentViewsModel = PaymentViewsModel(
    currentPaymentMethodName: 'Pembayaran Belum Dipilih',
    currentPaymentMethod: 'null',
    currentPaymentMethodNomor: 'null',
  );
  PaymentViewsModel get paymentViewsModel => _paymentViewsModel;

  String _waktuTransfer = 'Waktu Transfer';
  String get waktuTransfer => _waktuTransfer;

  String _noTransaksi = 'No. Transaksi';
  String get noTransaksi => _noTransaksi;

  String _noReferensi = 'No. Referensi';
  String get noReferensi => _noReferensi;

  DateTime? _dateTime;
  DateTime get dateTime => _dateTime!;

  String _buyResponse = 'null';
  String get buyResponse => _buyResponse;

  bool _isUsePoint = false;
  bool get isUsePoint => _isUsePoint;

  bool _selectedPayMethod = false;
  bool get selectedPayMethod => _selectedPayMethod;

  String? _message;
  String get message => _message!;

  PaymentState _state = PaymentState.none;
  PaymentState get state => _state;

  Future<String> buyMember(
    int userId,
    int memberId,
    int total,
    String method,
    String token,
  ) async {
    _state = PaymentState.loading;
    notifyListeners();
    try {
      final String data = await MemberServices().buyMember(
        userId,
        memberId,
        total,
        method,
        token,
      );

      if (data == 'Membership Created') {
        _state = PaymentState.hashdata;
        notifyListeners();
      } else {
        _message = data;
        _state = PaymentState.error;
        notifyListeners();
      }

      _buyResponse = data;
      return data;
    } catch (e) {
      _message = e.toString();
      _state = PaymentState.error;
      notifyListeners();
      return '';
    }
  }

  Future<bool> usePoint() {
    _isUsePoint = !_isUsePoint;
    notifyListeners();
    return Future.value(_isUsePoint);
  }

  Future<PaymentViewsModel> pilihMetode(
    int index,
    String value,
    String name,
    String nomor,
  ) async {
    _state = PaymentState.loading;
    notifyListeners();
    try {
      _selectedPayMethod = true;
      notifyListeners();

      _paymentViewsModel = PaymentViewsModel(
        currentPaymentIndex: index,
        currentPaymentMethodName: name,
        currentPaymentMethod: value,
        currentPaymentMethodNomor: nomor,
      );
      _state = PaymentState.hashdata;
      notifyListeners();
      return _paymentViewsModel;
    } catch (e) {
      _message = e.toString();
      _state = PaymentState.error;
      notifyListeners();
      return _paymentViewsModel;
    }
  }

  void resetPaymentMethod() {
    _selectedPayMethod = false;

    _paymentViewsModel = PaymentViewsModel(
      currentPaymentIndex: null,
      currentPaymentMethodName: 'Pembayaran Belum Dipilih',
      currentPaymentMethod: 'null',
      currentPaymentMethodNomor: 'null',
    );
    notifyListeners();
  }

  Future<String> getDateTf() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd – kk:mm');
    _waktuTransfer = formatter.format(now);
    notifyListeners();
    return Future.value(_waktuTransfer);
  }

  getUid() {
    var uuid = const Uuid();
    _noTransaksi = uuid.v1();
    _noReferensi = uuid.v4();
    notifyListeners();
  }
}
