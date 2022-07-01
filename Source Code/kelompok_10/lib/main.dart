import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'animation/transition_animation.dart';
import 'view/date_screen.dart';
import 'view/detail_category.dart';
import 'view/detail_class.dart';
import 'view/login_screen.dart';
import 'view/main_screen.dart';
import 'view/membership_detail.dart';
import 'view/membership_purchase.dart';
import 'view/on_search_screen.dart';
import 'view/payment_method_screen.dart';
import 'view/profile_screen.dart';
import 'view/news_screen.dart';
import 'view/signup_screen.dart';
import 'view/home_screen.dart';
import 'view/onboarding_page.dart';
import 'view/splash_screen.dart';
import 'view_model/auth_view_model.dart';
import 'view_model/preferences_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: (setting) {
          if (setting.name == SplashScreen.routeName) {
            return FadeInRoute(
              page: const SplashScreen(),
            );
          }
          if (setting.name == OnboardingScreen.routeName) {
            return FadeInRoute(
              page: const OnboardingScreen(),
            );
          }
          if (setting.name == LogInScreen.routeName) {
            return FadeInRoute(
              page: const LogInScreen(),
            );
          }
          if (setting.name == SignUpScreen.routeName) {
            return FadeInRoute(
              page: const SignUpScreen(),
            );
          }
          if (setting.name == HomeScreen.routeName) {
            return FadeInRoute(
              page: const HomeScreen(),
            );
          }
          if (setting.name == MainScreen.routeName) {
            return FadeInRoute(
              page: const MainScreen(),
            );
          }
          if (setting.name == NewsScreen.routeName) {
            return FadeInRoute(
              page: const NewsScreen(),
            );
          }
          if (setting.name == DateScreen.routeName) {
            return FadeInRoute(
              page: const DateScreen(),
            );
          }
          if (setting.name == ProfileScreen.routeName) {
            return FadeInRoute(
              page: const ProfileScreen(),
            );
          }
          if (setting.name == DetailCategory.routeName) {
            return FadeInRoute(
              page: const DetailCategory(),
            );
          }
          if (setting.name == OnSearchScreen.routeName) {
            return FadeInRoute(
              page: const OnSearchScreen(),
            );
          }
          if (setting.name == DetailClass.routeName) {
            return FadeInRoute(
              page: const DetailClass(),
            );
          }
          if (setting.name == MembershipPurchase.routeName) {
            return FadeInRoute(
              page: const MembershipPurchase(),
            );
          }
          if (setting.name == MembershipDetail.routeName) {
            return FadeInRoute(
              page: MembershipDetail(),
            );
          }
          if (setting.name == PaymentMethod.routeName) {
            return FadeInRoute(
              page: PaymentMethod(),
            );
          }
          return null;
        },
      ),
    );
  }
}
