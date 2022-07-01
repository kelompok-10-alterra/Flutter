import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:kelompok_10/animation/fade_animation.dart';
import 'package:kelompok_10/animation/scale_animation.dart';

import '../theme/theme.dart';

class PaymentMethodScreen extends StatefulWidget {
  PaymentMethodScreen({
    Key? key,
    required this.selectedRadio,
    // required this.selectedValue,
  }) : super(key: key);

  bool selectedRadio;
  // String selectedValue;

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
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
              setState(() {
                widget.selectedRadio = !widget.selectedRadio;
              });
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 44.0,
                        child: Image.asset(
                          'assets/images/logo-bri.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 14.0,
                      ),
                      Text(
                        'BRI Virtual Account',
                        style: blackTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: semiBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        width: 14.0,
                      ),
                    ],
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
            onTap: () {},
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
}
