import 'package:flutter/material.dart';
import 'package:kelompok_10/view/main_screen.dart';
import 'package:kelompok_10/view/onboarding_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme.dart';
import '../view_model/preferences_viewmodel.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? isViews;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _checkOnBoard();
      },
    );

    Future.delayed(
      const Duration(seconds: 3),
      () async {
        // isViews != 0
        //     ? Navigator.pushReplacementNamed(
        //         context, OnboardingScreen.routeName)
        //     : Navigator.pushReplacementNamed(context, LogInScreen.routeName);
        Provider.of<PreferencesViewModel>(context, listen: false)
            .getToken()
            .then(
          (value) async {
            if (value.isEmpty && isViews != 0) {
              Navigator.pushReplacementNamed(
                  context, OnboardingScreen.routeName);
            } else if (isViews != 1 && value.isNotEmpty) {
              Navigator.pushReplacementNamed(context, MainScreen.routeName);
            } else if (isViews != 1 && value.isEmpty) {
              Navigator.pushReplacementNamed(context, LogInScreen.routeName);
            }
          },
        );
      },
    );
  }

  _checkOnBoard() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isViews = prefs.getInt('onBoard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(64.0),
        height: displayHeight(context),
        width: displayWidth(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              gradientOneColor,
              gradientTwoColor,
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo-white.png',
            width: displayWidth(context) * 0.6,
          ),
        ),
      ),
    );
  }
}
