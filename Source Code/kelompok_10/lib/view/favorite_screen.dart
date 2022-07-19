import 'package:flutter/material.dart';

import '../component/back_button.dart';
import '../component/card_gridview.dart';
import '../theme/theme.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite-screen';
  const FavoriteScreen({Key? key}) : super(key: key);

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
              'Favorite',
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
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                mainAxisExtent: 237.0,
              ),
              itemCount: 6,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox();
                // CardGridView();
              },
            ),
            SizedBox(
              height: defaultMargin,
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
