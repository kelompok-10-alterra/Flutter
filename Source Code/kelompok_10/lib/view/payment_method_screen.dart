import 'package:flutter/material.dart';

import '../component/back_button.dart';
import '../component/primary_button.dart';
import '../theme/theme.dart';

class PaymentMethod extends StatefulWidget {
  static const String routeName = '/payment-method';
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final _pageController = PageController();
  int currentIndex = 0;
  bool? complete;

  List<String> stepTitle = [
    'Pilih metode',
    'Bayar',
    'Selesai',
  ];

  Widget costumStepIndicator(
    PageController controller,
    int currentStep,
    int? index,
    int? nomor,
    String? tittle,
    Color? color,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 24.0,
              width: 24.0,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  nomor.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 6.0,
            ),
            Text(
              tittle!,
              style: greyTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: regular,
              ),
            )
          ],
        ),
      ],
    );
  }

  AppBar header() {
    return AppBar(
      backgroundColor: whiteColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackButtons(
            height: 40.0,
            width: 40.0,
          ),
          Text(
            'Metode Pembayaran',
            style: blackTextStyle.copyWith(
              fontSize: 20.0,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            width: 40,
          )
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: stepTitle.asMap().entries.map(
              (entry) {
                final index = entry.key;
                final title = entry.value;
                return Row(
                  children: [
                    costumStepIndicator(
                      _pageController,
                      currentIndex,
                      index,
                      index + 1,
                      title,
                      circleColor(index),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Visibility(
                      visible: index != 2 ? true : false,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: index != 2 ? 8.0 : 0.0,
                        ),
                        height: 1.5,
                        width: 14.0,
                        // margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: defaultMargin,
            horizontal: defaultMargin,
          ),
          child: Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: 'Kembali',
                  press: () {
                    back();
                  },
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: PrimaryButton(
                  text: 'Lanjut',
                  press: () {
                    next();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text(
          'data',
          style: blackTextStyle.copyWith(
            fontSize: 24.0,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }

  next() {
    if (currentIndex < stepTitle.length - 1) {
      goTo(currentIndex + 1);
    }

    // if (currentIndex <= stepTitle.length) {
    //   goTo(currentIndex + 1);
    // }
  }

  back() {
    if (currentIndex > 0) {
      goTo(currentIndex - 1);
    }
  }

  goTo(int step) {
    setState(() => currentIndex = step);
    if (currentIndex > stepTitle.length) {
      setState(() => complete = true);
    }
  }

  // circleColor(i) {
  //   if (i + 1 < currentIndex) {
  //     return greenColor;
  //   } else if (i + 1 == currentIndex) {
  //     return greenColor;
  //   } else {
  //     return primaryColor;
  //   }
  // }

  circleColor(i) {
    Color color;
    if (i + 1 < currentIndex) {
      color = greenColor;
    } else if (i + 1 == currentIndex) {
      color = greenColor;
    } else {
      color = primaryColor;
    }
    return color;
  }
}
