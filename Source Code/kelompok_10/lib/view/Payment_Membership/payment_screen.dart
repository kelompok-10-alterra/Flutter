import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:kelompok_10/component/costum_switch_button.dart';
import 'package:kelompok_10/component/text_button.dart';
import 'package:kelompok_10/view_model/payment_view_model.dart';
import 'package:kelompok_10/view_model/toast_view_model.dart';
import 'package:provider/provider.dart';

import '../../component/back_button.dart';
import '../../component/loading_button.dart';
import '../../component/primary_button.dart';
import '../../component/stepper.dart';
import '../../model/member_model.dart';
import '../../theme/theme.dart';
import '../../view_model/auth_view_model.dart';
import '../../view_model/member_view_model.dart';
import '../../view_model/preferences_viewmodel.dart';
import 'pay_screen.dart';
import 'payment_done_screen.dart';
import 'payment_method_screen.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = '/payment-method';
  const PaymentScreen({
    Key? key,
    required this.member,
  }) : super(key: key);

  final MemberModel member;

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
  bool selectedRadio = false;
  String? selectedValue;

  next() {
    final PaymentViewModel state =
        Provider.of<PaymentViewModel>(context, listen: false);
    final ToastViewModel toast =
        Provider.of<ToastViewModel>(context, listen: false);
    if (state.selectedPayMethod == false &&
        state.paymentViewsModel.currentPaymentMethodNomor == 'null') {
      toast.showToast('Pilih metode pembayaran');
    } else {
      if (currentStep <= stepLength) {
        goTo(currentStep + 1);
      } else if (currentStep == stepLength) {
        null;
      }
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
    if (currentStep == 1) {
      Provider.of<PaymentViewModel>(context, listen: false)
          .resetPaymentMethod();
      Navigator.pop(context);
    } else if (currentStep == 2) {
      goTo(currentStep - 1);
    } else {
      Provider.of<PaymentViewModel>(context, listen: false)
          .resetPaymentMethod();
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
        member: widget.member,
      );
    } else if (currentStep == 2) {
      return PayScreen(
        member: widget.member,
      );
    } else {
      return PaymentDoneScreen(
        members: widget.member,
      );
    }
  }

  Widget bottomBar() {
    if (currentStep == 1) {
      return Consumer<AuthViewModel>(builder: (context, state, _) {
        return Consumer<PaymentViewModel>(builder: (context, statePay, _) {
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
                      'Poin kamu sebanyak ${state.user.point}',
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                    CostumSwitchButton(
                      press: () {
                        statePay.usePoint();
                      },
                      values: statePay.isUsePoint,
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
                        'Rp. ${widget.member.price.toString()}',
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
                  text:
                      'Bayar dengan ${statePay.paymentViewsModel.currentPaymentMethodName}',
                  press: () {
                    next();
                  },
                ),
              ],
            ),
          );
        });
      });
    } else if (currentStep == 2) {
      return Consumer<PreferencesViewModel>(builder: (context, statePref, _) {
        return Consumer<MemberViewModel>(builder: (context, stateType, _) {
          return Consumer<AuthViewModel>(builder: (context, stateAuth, _) {
            return Consumer<PaymentViewModel>(builder: (context, statePay, _) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: defaultMargin,
                ),
                child: stateType.state == MemberState.loading
                    ? const LoadingButton()
                    : PrimaryButton(
                        text: 'Bayar Sekarang',
                        press: () {
                          statePref.getToken();

                          stateType.buyMember(
                            stateAuth.user.userId!,
                            widget.member.memberId!,
                            widget.member.price!,
                            statePay.paymentViewsModel.currentPaymentMethodName,
                            statePref.token.accessToken!,
                          );

                          print(stateType.memberData);
                          statePay.getDateTf();
                          statePay.getUid();
                          handleNext();
                        },
                      ),
              );
            });
          });
        });
      });
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final toast = Provider.of<ToastViewModel>(context, listen: false);

      toast.fToast = FToast();
      toast.fToast.init(context);
    });
    super.initState();
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
