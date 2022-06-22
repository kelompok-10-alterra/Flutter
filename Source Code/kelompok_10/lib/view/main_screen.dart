import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kelompok_10/theme/theme.dart';

import 'date_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'news_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main-screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  int get currentsIndexs => currentIndex;

  final List<Widget> body = [
    const HomeScreen(),
    const NewsScreen(),
    const DateScreen(),
    const ProfileScreen(),
  ];

  Widget customBottomNav() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: whiteColor,
      currentIndex: currentsIndexs,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        setState(() {
          currentIndex = value;

          // ignore: avoid_print
          print(value);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/ic-home.svg',
            width: 21,
            color: currentsIndexs == 0 ? primaryColor : greyColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/ic-search-btm.svg',
            width: 21,
            color: currentsIndexs == 1 ? primaryColor : greyColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/ic-date.svg',
            width: 21,
            color: currentsIndexs == 2 ? primaryColor : greyColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/ic-profile-btm.svg',
            width: 21,
            color: currentsIndexs == 3 ? primaryColor : greyColor,
          ),
          label: '',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: body[currentIndex],
    );
  }
}
