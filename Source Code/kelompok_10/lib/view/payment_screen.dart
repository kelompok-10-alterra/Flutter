import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kelompok_10/component/costum_switch_button.dart';
import 'package:kelompok_10/component/text_button.dart';

import '../component/back_button.dart';
import '../component/primary_button.dart';
import '../component/stepper.dart';
import '../theme/theme.dart';
import 'pay_screen.dart';
import 'payment_done_screen.dart';
import 'payment_method_screen.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = '/payment-method';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<String> stepTitle = [
    'Pilih metode',
    'Bayar',
    'Selesai',
  ];

  int currentStep = 1;
  int stepLength = 3;
  bool? complete;
  bool isUsePoint = false;
  bool selectedRadio = false;
  String? selectedValue;

  next() {
    if (currentStep <= stepLength) {
      goTo(currentStep + 1);
    } else if (currentStep == stepLength) {
      null;
    }
  }

  handleNext() {
    if (currentStep == 1) {
      if (selectedRadio == false) {
        return;
      } else {
        next();
      }
    } else {
      next();
    }
  }

  backHandle() {
    if (currentStep > 1) {
      goTo(currentStep - 1);
    } else {
      Navigator.pop(context);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
    if (currentStep > stepLength) {
      setState(() => complete = true);
    }
  }

  Widget costumStepIndicator() {
    return CostumStapper(
      tittle: 'cek',
      totalSteps: stepTitle.length,
      width: MediaQuery.of(context).size.width,
      curStep: currentStep,
      stepCompleteColor: greenColor,
      currentStepColor: greenColor,
      inactiveColor: orangeColor,
      lineWidth: 2.0,
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
          BackButtons(
            press: () {
              backHandle();
            },
            height: 40.0,
            width: 40.0,
          ),
          Text(
            currentStep != 3 ? 'Metode Pembayaran' : 'Pembayaran Berhasil',
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
        child: costumStepIndicator(),
      ),
    );
  }

  Widget content() {
    if (currentStep == 1) {
      return PaymentMethodScreen(
        selectedRadio: selectedRadio,
      );
    } else if (currentStep == 2) {
      return const PayScreen();
    } else {
      return const PaymentDoneScreen();
    }
  }

  Widget bottomBar() {
    if (currentStep == 1) {
      return Container(
        padding: EdgeInsets.only(
          top: 16.0,
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.15),
              spreadRadius: 1,
              offset: const Offset(0, 1),
              blurRadius: 7,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Poin kamu sebanyak 100',
                  style: blackTextStyle.copyWith(fontSize: 12),
                ),
                CostumSwitchButton(
                  press: () {
                    setState(
                      () {
                        isUsePoint = !isUsePoint;
                      },
                    );
                  },
                  values: isUsePoint,
                )
              ],
            ),
            const SizedBox(
              height: 6.0,
            ),
            Divider(
              color: greyThreeColor,
              thickness: 1,
            ),
            const SizedBox(
              height: 6.0,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Rp. 20.000',
                    style: blackTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 14.0,
                  child: SvgPicture.asset(
                    'assets/svg/ic-dropdown.svg',
                    color: blackColor,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            PrimaryButton(
              text: 'Bayar dengan Virtual Account',
              press: () {
                next();
              },
            ),
          ],
        ),
      );
    } else if (currentStep == 2) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        child: PrimaryButton(
          text: 'Bayar Sekarang',
          press: () {
            handleNext();
          },
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              withIcon: true,
              icons: 'assets/svg/ic-forward.svg',
              text: 'Bagikan',
              press: () {},
            ),
            const SizedBox(
              height: 12.0,
            ),
            SizedBox(
              height: 32.0,
              width: displayWidth(context),
              child: Center(
                child: TextButtons(
                  text: 'Unduh',
                  press: () {},
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      bottomNavigationBar: bottomBar(),
      body: content(),
    );
  }
}
