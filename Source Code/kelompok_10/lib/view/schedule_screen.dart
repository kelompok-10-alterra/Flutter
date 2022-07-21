import 'package:flutter/material.dart';

import '../component/card_schedule.dart';
import '../theme/theme.dart';

class ScheduleScreen extends StatefulWidget {
  static const routeName = '/schedule-screen';
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  List<String> member = [
    'assets/images/persone-one.png',
    'assets/images/persone-one.png',
    'assets/images/persone-one.png',
    'assets/images/persone-one.png',
  ];

  final avatarWidth = 32.0;
  final overlayWidth = 12.0;

  Widget comingSoon() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin -6.0,
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
              (index) => CardSchedule(
                member: member,
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
                width: 40,
              ),
              Text(
                'Jadwal',
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
                  text: 'Akan berlangsung',
                ),
                Tab(
                  text: 'Semua',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            comingSoon(),
            const Center(
              child: Text('Semua'),
            ),
          ],
        ),
      ),
    );
  }
}
