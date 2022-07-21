import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../component/card-profile.dart';
import '../component/card_membership.dart';
import '../theme/theme.dart';
import '../view_model/preferences_viewmodel.dart';
import 'detail_akun_screen.dart';
import 'favorite_screen.dart';
import 'login_screen.dart';
import 'point_screen.dart';
import 'riwayat_pembelian_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
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
            const SizedBox(
              width: 40,
            ),
            Text(
              'Profile',
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
      );
    }

    Widget content() {
      return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // CardMembership(
          //   starColor: gradientFiveColor,
          //   endColor: gradientTwoColor,
          //   username: 'John Doe',
          //   id: '123456789',
          //   membershipType: 'Silver',
          //   date: 'Berlaku 1 bulan',
          // ),
          const SizedBox(
            height: 8.0,
          ),
          Column(
            children: List.generate(
              profileData.length,
              (index) => GestureDetector(
                onTap: () {
                  if (index == 5) {
                    _showToast('Tekan 2 kali untuk keluar');
                  } else if (index == 0) {
                    Navigator.pushNamed(context, DetailAkunScreen.routeName);
                  } else if (index == 1) {
                    Navigator.pushNamed(context, FavoriteScreen.routeName);
                  } else if (index == 2) {
                    Navigator.pushNamed(
                        context, RiwayatPembelianScreen.routeName);
                  } else if (index == 3) {
                    Navigator.pushNamed(context, PointScreen.routeName);
                  } else {
                    _showToast('Maintenance in progress');
                  }
                },
                onDoubleTap: () {
                  if (index == 5) {
                    Provider.of<PreferencesViewModel>(context, listen: false)
                        .deleteUser();
                    Navigator.pushNamedAndRemoveUntil(
                        context, LogInScreen.routeName, (route) => false);
                  } else {}
                },
                child: CardProfile(
                  icons: profileData[index].icons,
                  title: profileData[index].title,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      body: content(),
    );
  }

  _showToast(String tittle) {
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
            tittle,
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

class ProfileModel {
  final String icons;
  final String title;

  ProfileModel(
    this.icons,
    this.title,
  );
}

List<ProfileModel> profileData = [
  ProfileModel(
    'assets/svg/ic-profile-btm.svg',
    'Detail Akun',
  ),
  ProfileModel(
    'assets/svg/ic-favorite.svg',
    'Favorit',
  ),
  ProfileModel(
    'assets/svg/ic-clock.svg',
    'Riwayat Pembelian',
  ),
  ProfileModel(
    'assets/svg/ic-point.svg',
    'Point',
  ),
  ProfileModel(
    'assets/svg/ic-setting.svg',
    'Pengaturan',
  ),
  ProfileModel(
    'assets/svg/ic-logout.svg',
    'Keluar',
  ),
];
