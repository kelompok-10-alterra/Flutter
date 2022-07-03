// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:kelompok_10/animation/fade_animation.dart';
import 'package:kelompok_10/animation/scale_animation.dart';

import '../component/card_mitra_payment.dart';
import '../theme/theme.dart';

class PaymentMethodScreen extends StatefulWidget {
  PaymentMethodScreen({
    Key? key,
    required this.selectedRadio,
  }) : super(key: key);

  bool selectedRadio;

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final TextEditingController _codeController = TextEditingController();
  FToast fToast = FToast();

  bool currentSelectedPayment = false;
  int? currentPaymentIndex;
  String currentPaymentMethod = '';
  String currentPaymentMethodName = 'Pembayaran Belum Dipilih';

  bool vaIsActive = false;
  bool bankIsActive = false;
  bool eWalletIsActive = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  String? selectedValue;
  final List<String> items = [
    'Paket membership Silver',
    'Paket membership Gold',
    'Paket membership Platinum',
  ];

  Widget membership() {
    return Container(
      width: displayWidth(context),
      height: 157.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: greyTwoColor.withOpacity(0.15),
            spreadRadius: 1,
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selesaikan dalam',
                style: blackTextStyle.copyWith(
                  fontSize: 18.0,
                  fontWeight: semiBold,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 20.0,
                    width: 20.0,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '00',
                        style: whiteTextStyle.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    ':',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12.0,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '00',
                        style: whiteTextStyle.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    ':',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12.0,
                      fontWeight: regular,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '00',
                        style: whiteTextStyle.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 14.0,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 44.0,
                    width: 44.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: blueTwoColor,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/ic-card.svg',
                      color: primaryColor,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                  Text(
                    'Pilih membership',
                    style: blackTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: semiBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                ],
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 44.0,
                            width: 44.0,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueTwoColor,
                            ),
                            child: SvgPicture.asset(
                              'assets/svg/ic-card.svg',
                              color: primaryColor,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(
                            width: 14.0,
                          ),
                          Text(
                            item,
                            style: blackTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              icon: SvgPicture.asset('assets/svg/ic-dropdown.svg'),
              iconSize: 14,
              iconEnabledColor: primaryColor,
              iconDisabledColor: blackColor,
              buttonHeight: 75,
              buttonWidth: displayWidth(context),
              buttonPadding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 16.0,
              ),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: blueColor,
              ),
              buttonElevation: 0,
              itemHeight: 75,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 241,
              dropdownWidth: displayWidth(context) - 77.0,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: blueColor,
              ),
              dropdownElevation: 0,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 2,
              scrollbarAlwaysShow: true,
              offset: const Offset(0, 0),
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
        ],
      ),
    );
  }

  Widget metodePembayaran() {
    return Container(
      width: displayWidth(context),
      margin: EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: greyTwoColor.withOpacity(0.15),
            spreadRadius: 1,
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Metode Pembayaran',
            style: blackTextStyle.copyWith(
              fontSize: 16.0,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  if (currentSelectedPayment == false) {
                    _showToast();
                  } else {
                    widget.selectedRadio = !widget.selectedRadio;
                  }
                },
              );
            },
            child: Container(
              width: displayWidth(context),
              padding: const EdgeInsets.all(
                16.0,
              ),
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: currentPaymentMethod != '' ? 44.0 : 0.0,
                          child: currentPaymentMethod != ''
                              ? Image.asset(
                                  currentPaymentMethod,
                                  fit: BoxFit.contain,
                                )
                              : const SizedBox(),
                        ),
                        const SizedBox(
                          width: 14.0,
                        ),
                        Expanded(
                          child: Text(
                            currentPaymentMethodName,
                            style: blackTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(
                          width: 14.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: primaryColor,
                        width: 2.0,
                      ),
                    ),
                    child: Visibility(
                      visible: widget.selectedRadio,
                      child: ScaleAnimations(
                        child: FadeAnimation(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          GestureDetector(
            onTap: () async {
              await showBottomSheet(context);
              setState(() {});
            },
            child: Container(
              height: 49.0,
              width: displayWidth(context),
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'Pilih Metode Pembayaran',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget kodePromo() {
    return Container(
      width: displayWidth(context),
      margin: EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: greyTwoColor.withOpacity(0.15),
            spreadRadius: 1,
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bayar lebih hemat!',
            style: blackTextStyle.copyWith(
              fontSize: 16.0,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _codeController,
                  style: blackTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: regular,
                  ),
                  decoration: InputDecoration(
                    fillColor: whiteTwoColor,
                    filled: true,
                    hintStyle: greyTwoTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: regular,
                    ),
                    errorStyle: redTextStyle.copyWith(
                      fontSize: 8.0,
                      fontWeight: regular,
                    ),
                    hintText: 'Masukkan kode',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: greyTwoColor,
                        width: 1.0,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryColor,
                        width: 1.5,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 49.0,
                  width: 80.0,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      'Gunakan',
                      style: whiteTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: defaultMargin,
          ),
          membership(),
          metodePembayaran(),
          kodePromo(),
          SizedBox(
            height: defaultMargin,
          ),
        ],
      ),
    );
  }

  final List<PaymentModel> virtualAccount = [
    PaymentModel(
      name: 'BRI Virtual Account',
      images: 'assets/images/logo-bri-2.png',
      imagesSelected: 'assets/images/logo-bri.png',
    ),
    PaymentModel(
      name: 'BCA Virtual Account',
      images: 'assets/images/logo-bca.png',
      imagesSelected: 'assets/images/logo-bca-2.png',
    ),
    PaymentModel(
      name: 'MANDIRI Virtual Account',
      images: 'assets/images/logo-mandiri.png',
      imagesSelected: 'assets/images/logo-mandiri-2.png',
    ),
    PaymentModel(
      name: 'BNI Virtual Account',
      images: 'assets/images/logo-bni.png',
      imagesSelected: 'assets/images/logo-bni-2.png',
    ),
  ];

  final List<PaymentModel> transfer = [
    PaymentModel(
      name: 'Transfer BRI',
      images: 'assets/images/logo-bri-2.png',
      imagesSelected: 'assets/images/logo-bri.png',
    ),
    PaymentModel(
      name: 'Transfer BCA',
      images: 'assets/images/logo-bca.png',
      imagesSelected: 'assets/images/logo-bca-2.png',
    ),
  ];

  final List<PaymentModel> eWallet = [
    PaymentModel(
      name: 'OVO',
      images: 'assets/images/logo-ovo.png',
      imagesSelected: 'assets/images/logo-ovo-2.png',
    ),
    PaymentModel(
      name: 'Shopee Pay',
      images: 'assets/images/logo-shopee.png',
      imagesSelected: 'assets/images/logo-shopee-2.png',
    ),
    PaymentModel(
      name: 'Dana',
      images: 'assets/images/logo-dana.png',
      imagesSelected: 'assets/images/logo-dana-2.png',
    ),
    PaymentModel(
      name: 'Gopay',
      images: 'assets/images/logo-gopay.png',
      imagesSelected: 'assets/images/logo-gopay-2.png',
    ),
  ];

//BottomSheet
  Future<dynamic> showBottomSheet(
    BuildContext context,
  ) async {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: transparentColor,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Wrap(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 12.0,
                    left: defaultMargin,
                    right: defaultMargin,
                    bottom: defaultMargin,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 6.0,
                          width: displayWidth(context) * 0.18,
                          decoration: BoxDecoration(
                            color: greyTwoColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Text(
                        'Pilih Metode Pembayaran',
                        style: blackTextStyle.copyWith(
                          fontSize: 18.0,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Text(
                        'Virtual Account',
                        style: blackTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        //row list form virtual
                        child: Row(
                          children: [
                            for (var i = 0; i < virtualAccount.length; i++)
                              GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      vaIsActive = true;
                                      bankIsActive = false;
                                      eWalletIsActive = false;
                                      currentSelectedPayment = true;
                                      currentPaymentIndex = i;
                                      currentPaymentMethod =
                                          virtualAccount[i].imagesSelected;
                                      currentPaymentMethodName =
                                          virtualAccount[i].name;
                                    },
                                  );
                                },
                                child: CardMitraPayment(
                                  index: i,
                                  currentPaymentIndex: currentPaymentIndex,
                                  list: virtualAccount,
                                  isActive: vaIsActive,
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Text(
                        'Transfer',
                        style: blackTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        //row list form virtual
                        child: Row(
                          children: [
                            for (var i = 0; i < transfer.length; i++)
                              GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      vaIsActive = false;
                                      bankIsActive = true;
                                      eWalletIsActive = false;
                                      currentSelectedPayment = true;
                                      currentPaymentIndex = i;
                                      currentPaymentMethod =
                                          transfer[i].imagesSelected;
                                      currentPaymentMethodName =
                                          transfer[i].name;
                                    },
                                  );
                                },
                                child: CardMitraPayment(
                                  index: i,
                                  currentPaymentIndex: currentPaymentIndex,
                                  list: transfer,
                                  isActive: bankIsActive,
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Text(
                        'E wallet',
                        style: blackTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        //row list form virtual
                        child: Row(
                          children: [
                            for (var i = 0; i < eWallet.length; i++)
                              GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      vaIsActive = false;
                                      bankIsActive = false;
                                      eWalletIsActive = true;
                                      currentSelectedPayment = true;
                                      currentPaymentIndex = i;
                                      currentPaymentMethod =
                                          eWallet[i].imagesSelected;
                                      currentPaymentMethodName =
                                          eWallet[i].name;
                                    },
                                  );
                                },
                                child: CardMitraPayment(
                                  index: i,
                                  currentPaymentIndex: currentPaymentIndex,
                                  list: eWallet,
                                  isActive: eWalletIsActive,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
        });
  }

  _showToast() {
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: greyFiveColor,
        boxShadow: [
          BoxShadow(
            color: greyTwoColor.withOpacity(0.15),
            spreadRadius: 3,
            offset: const Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pembayaran Belum Dipilih',
            style: whiteTextStyle.copyWith(
              fontSize: 14.0,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}

class PaymentModel {
  final String name;
  final String images;
  final String imagesSelected;

  PaymentModel({
    required this.name,
    required this.images,
    required this.imagesSelected,
  });
}
