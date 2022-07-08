import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:kelompok_10/theme/theme.dart';

import '../component/card_payment_done.dart';
import '../component/costum_sparator.dart';
import '../component/costum_ticket_shape.dart';

class PaymentDoneScreen extends StatelessWidget {
  static const routeName = '/payment-done';
  const PaymentDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              '20.000',
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
                              value: payDoneData[index].text,
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

List<PayDoneModel> payDoneData = [
  PayDoneModel(
    'Transfer ke',
    'BRI Virtual Account',
  ),
  PayDoneModel(
    'Jumlah Transfer',
    '20.000',
  ),
  PayDoneModel(
    'No. Transaksi',
    '112234584u9555',
  ),
  PayDoneModel(
    'No. Referensi',
    '23849385941111',
  ),
  PayDoneModel(
    'Waktu Selesai',
    '29-06-2022 14.21',
  ),
];
