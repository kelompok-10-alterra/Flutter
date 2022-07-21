class PaymentMethodModel {
  final String name;
  final String images;
  final String imagesSelected;
  final String nomor;

  PaymentMethodModel({
    required this.name,
    required this.images,
    required this.imagesSelected,
    required this.nomor,
  });
}

class PaymentViewsModel {
  int? currentPaymentIndex;
  String currentPaymentMethod;
  String currentPaymentMethodName;
  String currentPaymentMethodNomor;

  PaymentViewsModel({
    this.currentPaymentIndex,
    required this.currentPaymentMethod,
    required this.currentPaymentMethodName,
    required this.currentPaymentMethodNomor,
  });
}

final List<PaymentMethodModel> virtualAccount = [
  PaymentMethodModel(
    name: 'BRI Virtual Account',
    images: 'assets/images/logo-bri-2.png',
    imagesSelected: 'assets/images/logo-bri.png',
    nomor: '311860000001031',
  ),
  PaymentMethodModel(
    name: 'BCA Virtual Account',
    images: 'assets/images/logo-bca.png',
    imagesSelected: 'assets/images/logo-bca-2.png',
    nomor: '123456789',
  ),
  PaymentMethodModel(
    name: 'MANDIRI Virtual Account',
    images: 'assets/images/logo-mandiri.png',
    imagesSelected: 'assets/images/logo-mandiri-2.png',
    nomor: '123456789',
  ),
  PaymentMethodModel(
    name: 'BNI Virtual Account',
    images: 'assets/images/logo-bni.png',
    imagesSelected: 'assets/images/logo-bni-2.png',
    nomor: '123456789',
  ),
];

final List<PaymentMethodModel> transfer = [
  PaymentMethodModel(
    name: 'Transfer BRI',
    images: 'assets/images/logo-bri-2.png',
    imagesSelected: 'assets/images/logo-bri.png',
    nomor: '311860000001031',
  ),
  PaymentMethodModel(
    name: 'Transfer BCA',
    images: 'assets/images/logo-bca.png',
    imagesSelected: 'assets/images/logo-bca-2.png',
    nomor: '123456789',
  ),
];

final List<PaymentMethodModel> eWallet = [
  PaymentMethodModel(
    name: 'OVO',
    images: 'assets/images/logo-ovo.png',
    imagesSelected: 'assets/images/logo-ovo-2.png',
    nomor: '081395239760',
  ),
  PaymentMethodModel(
    name: 'Shopee Pay',
    images: 'assets/images/logo-shopee.png',
    imagesSelected: 'assets/images/logo-shopee-2.png',
    nomor: '081395239760',
  ),
  PaymentMethodModel(
    name: 'Dana',
    images: 'assets/images/logo-dana.png',
    imagesSelected: 'assets/images/logo-dana-2.png',
    nomor: '081395239760',
  ),
  PaymentMethodModel(
    name: 'Gopay',
    images: 'assets/images/logo-gopay.png',
    imagesSelected: 'assets/images/logo-gopay-2.png',
    nomor: '081395239760',
  ),
];
