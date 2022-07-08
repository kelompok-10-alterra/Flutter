import 'package:flutter/material.dart';
import '../component/back_button.dart';
import '../component/card_riwayat_pembelian.dart';
import '../theme/theme.dart';

class RiwayatPembelianScreen extends StatelessWidget {
  static const routeName = '/riwayat-pembelian-screen';
  const RiwayatPembelianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              'Riwayat',
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
      );
    }

    Widget content() {
      return Padding(
        padding: EdgeInsets.only(
          left: defaultMargin - 6.0,
          right: defaultMargin - 6.0,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return CardRiwayatPembelian();
              },
            ),
            SizedBox(
              height: defaultMargin - 6.0,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      body: content(),
    );
  }
}
