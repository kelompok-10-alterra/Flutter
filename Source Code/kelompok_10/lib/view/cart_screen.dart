import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kelompok_10/animation/fade_animation.dart';
import 'package:kelompok_10/model/class_model.dart';
import 'package:provider/provider.dart';

import '../component/back_button.dart';
import '../component/card_cart.dart';
import '../component/card_schedule.dart';
import '../component/costum_switch_button.dart';
import '../component/primary_button.dart';
import '../theme/theme.dart';
import '../view_model/auth_view_model.dart';
import '../view_model/payment_view_model.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart-screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  int currentTab = 0;
  var selectedIndexes = [];

  Widget semua() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin - 6.0,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: defaultMargin,
          ),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: List.generate(
              6,
              (index) => Row(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: primaryColor,
                    ),
                    child: SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        splashRadius: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        activeColor: primaryColor,
                        value: selectedIndexes.contains(index),
                        onChanged: (_) {
                          setState(() {
                            if (selectedIndexes.contains(index)) {
                              selectedIndexes.remove(index);
                            } else {
                              selectedIndexes.add(index);
                            }
                          });
                          print(selectedIndexes);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),
                  CardCart(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: defaultMargin - 16,
          ),
        ],
      ),
    );
  }

  Widget bottomBar() {
    if (currentTab == 0) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: blackTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Rp. 10000',
                      style: blackTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                PrimaryButton(
                  text: 'Bayar Sekarang',
                  press: () {},
                ),
              ],
            ),
          );
        });
      });
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 40.0,
                child: BackButtons(),
              ),
              Text(
                'Keranjang Saya',
                style: blackTextStyle.copyWith(
                  fontSize: 20.0,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: TabBar(
              onTap: (value) {
                setState(() {
                  currentTab = value;
                  print(currentTab);
                });
              },
              indicatorColor: primaryColor,
              labelStyle: blackTextStyle.copyWith(
                fontSize: 16.0,
                fontWeight: medium,
              ),
              unselectedLabelStyle: blackTextStyle.copyWith(
                fontSize: 16.0,
                fontWeight: regular,
              ),
              labelColor: primaryColor,
              unselectedLabelColor: greyColor,
              tabs: const <Widget>[
                Tab(
                  text: 'Semua',
                ),
                Tab(
                  text: 'Beli lagi',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            semua(),
            const Center(
              child: Text('Beli lagi'),
            ),
          ],
        ),
        bottomNavigationBar: bottomBar(),
      ),
    );
  }
}
