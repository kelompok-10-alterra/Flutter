
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:kelompok_10/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../component/card_payment_done.dart';
import '../../component/costum_sparator.dart';
import '../../component/costum_ticket_shape.dart';
import '../../model/member_model.dart';
import '../../view_model/payment_view_model.dart';

class PaymentDoneScreen extends StatefulWidget {
  static const routeName = '/payment-done';
  const PaymentDoneScreen({
    Key? key,
    required this.members,
  }) : super(key: key);

  final MemberModel members;

  @override
  State<PaymentDoneScreen> createState() => _PaymentDoneScreenState();
}

class _PaymentDoneScreenState extends State<PaymentDoneScreen> {
  @override
  Widget build(BuildContext context) {
    final paymentViewModel = Provider.of<PaymentViewModel>(context);

    List<PayDoneModel> payDoneData = [
      PayDoneModel(
        'Transfer ke',
        paymentViewModel.paymentViewsModel.currentPaymentMethodName,
      ),
      PayDoneModel(
        'Jumlah Transfer',
        widget.members.price.toString(),
      ),
      PayDoneModel(
        'No. Transaksi',
        paymentViewModel.noTransaksi.substring(1, 8),
      ),
      PayDoneModel(
        'No. Referensi',
        paymentViewModel.noReferensi.substring(1, 8),
      ),
      PayDoneModel(
        'Waktu Selesai',
        paymentViewModel.waktuTransfer,
      ),
    ];
    return Consumer<PaymentViewModel>(builder: (context, state, _) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: defaultMargin,
            ),
            SizedBox(
              height: 470.0,
              width: displayWidth(context),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 36,
                    bottom: 0,
                    child: ClipShadowPath(
                      clipper: CustomTicketShape(),
                      shadow: Shadow(
                        blurRadius: 10,
                        offset: const Offset(0, 0),
                        color: greyColor.withOpacity(0.2),
                      ),
                      child: Container(
                        width: displayWidth(context),
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 192,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: MySeparator(
                        color: greyFiveColor,
                        height: 0.8,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset('assets/svg/ic-succes.svg'),
                  ),
                  Positioned(
                    right: 0.0,
                    left: 0.0,
                    top: 98.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 28.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rp.',
                                style: blackTextStyle.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: semiBold,
                                ),
                              ),
                              const SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                widget.members.price.toString(),
                                style: blackTextStyle.copyWith(
                                  fontSize: 28.0,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Berhasil',
                          style: greyTwoTextStyle.copyWith(
                            fontSize: 14.0,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 195,
                    child: Column(
                      children: List.generate(
                        payDoneData.length,
                        (index) => SizedBox(
                          height: 55,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CardPaymentDone(
                                text: payDoneData[index].text,
                                value: payDoneData[index].value,
                              ),
                              const SizedBox(
                                height: 19.5,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Divider(
                                  height: 0,
                                  color: index == 4
                                      ? transparentColor
                                      : greyFiveColor.withAlpha(100),
                                  thickness: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class PayDoneModel {
  final String text;
  final String value;

  PayDoneModel(
    this.text,
    this.value,
  );
}
