// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:kelompok_10/animation/fade_animation.dart';
import 'package:kelompok_10/animation/scale_animation.dart';
import 'package:kelompok_10/view_model/payment_view_model.dart';
import 'package:provider/provider.dart';

import '../../component/card_list_barang.dart';
import '../../component/card_mitra_payment.dart';
import '../../component/costum_timer.dart';
import '../../model/member_model.dart';
import '../../model/payment_method_model.dart';
import '../../theme/theme.dart';

class PaymentMethodScreen extends StatefulWidget {
  PaymentMethodScreen({
    Key? key,
    required this.member,
  }) : super(key: key);

  final MemberModel member;

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final TextEditingController _codeController = TextEditingController();
  FToast fToast = FToast();

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

  Widget membership() {
    return Container(
      width: displayWidth(context),
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
              const CostumTimer()
            ],
          ),
          const SizedBox(
            height: 14.0,
          ),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              CardListBarang(
                value: 'Paket membership ${widget.member.name}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget metodePembayaran() {
    return Consumer<PaymentViewModel>(builder: (context, state, _) {
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
            Container(
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
                          width:
                              state.paymentViewsModel.currentPaymentMethod !=
                                      "null"
                                  ? 44.0
                                  : 0.0,
                          child:
                              state.paymentViewsModel.currentPaymentMethod !=
                                      'null'
                                  ? Image.asset(
                                      state.paymentViewsModel
                                          .currentPaymentMethod,
                                      fit: BoxFit.contain,
                                    )
                                  : const SizedBox(),
                        ),
                        const SizedBox(
                          width: 14.0,
                        ),
                        Expanded(
                          child: Text(
                            state.paymentViewsModel.currentPaymentMethodName,
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
                      visible: state.selectedPayMethod,
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
    });
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

//BottomSheet
  Future<dynamic> showBottomSheet(
    BuildContext context,
  ) async {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: transparentColor,
        builder: (context) {
          return Consumer<PaymentViewModel>(builder: (context, state, _) {
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

                                        Navigator.pop(context);
                                      },
                                    );
                                    state.pilihMetode(
                                      i,
                                      virtualAccount[i].imagesSelected,
                                      virtualAccount[i].name,
                                      virtualAccount[i].nomor,
                                    );
                                  },
                                  child: CardMitraPayment(
                                    index: i,
                                    currentPaymentIndex: state
                                        .paymentViewsModel.currentPaymentIndex,
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

                                        Navigator.pop(context);
                                      },
                                    );
                                    state.pilihMetode(
                                      i,
                                      transfer[i].imagesSelected,
                                      transfer[i].name,
                                      transfer[i].nomor,
                                    );
                                  },
                                  child: CardMitraPayment(
                                    index: i,
                                    currentPaymentIndex: state
                                        .paymentViewsModel.currentPaymentIndex,
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

                                        Navigator.pop(context);
                                      },
                                    );
                                    state.pilihMetode(
                                      i,
                                      eWallet[i].imagesSelected,
                                      eWallet[i].name,
                                      eWallet[i].nomor,
                                    );
                                  },
                                  child: CardMitraPayment(
                                    index: i,
                                    currentPaymentIndex: state
                                        .paymentViewsModel.currentPaymentIndex,
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
