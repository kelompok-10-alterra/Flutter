import 'package:flutter/material.dart';
import 'package:kelompok_10/animation/shimmer_effect.dart';
import 'package:kelompok_10/theme/theme.dart';
import 'package:kelompok_10/view_model/member_view_model.dart';
import 'package:provider/provider.dart';

import '../component/back_button.dart';
import '../component/card_list_membership.dart';
import '../view_model/preferences_viewmodel.dart';
import '../view_model/type_view_model.dart';

class MembershipPurchase extends StatefulWidget {
  static const String routeName = '/membership_purchase';
  const MembershipPurchase({Key? key}) : super(key: key);

  @override
  State<MembershipPurchase> createState() => _MembershipPurchaseState();
}

class _MembershipPurchaseState extends State<MembershipPurchase> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final token = Provider.of<PreferencesViewModel>(context, listen: false);

      Provider.of<TypeViewModel>(context, listen: false)
          .getAllType(token.token.accessToken!);
      Provider.of<MemberViewModel>(context, listen: false)
          .getAllMember(token.token.accessToken!);
    });
    super.initState();
  }

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
              'Membership',
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
      return Consumer<MemberViewModel>(builder: (context, state, _) {
        return ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            state.memberData.length,
            (index) => state.state == MemberState.loading
                ? ShimmerEffect(
                  child: Container(
                      margin: EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                        bottom: 16.0,
                      ),
                      width: displayWidth(context),
                      height: 175.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: whiteColor,
                      ),
                    ),
                )
                : state.state == MemberState.hashdata ? CardListMembership(
                    starColor: index == 0
                        ? gradientTwoColor
                        : index == 1
                            ? gradientPurpleOneColor
                            : gradientBrownOneColor,
                    endColor: index == 0
                        ? gradientFiveColor
                        : index == 1
                            ? gradientPurpleTwoColor
                            : gradientBrownTwoColor,
                    starPrice: index == 0
                        ? '150.000'
                        : index == 1
                            ? '350.000'
                            : '750.000',
                    member: state.memberData[index],
                  ) :state.state == MemberState.isEmpty ? 
                  const Center(
                    child: Text('Data tidak ditemukan'),
                  ) : Container(),
          ),
        );
      });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 16.0,
          ),
          content(),
        ],
      ),
    );
  }
}
