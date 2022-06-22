import 'package:flutter/material.dart';
import 'package:kelompok_10/animation/transition_animation.dart';
import 'package:kelompok_10/view/on_search_screen.dart';
import 'package:kelompok_10/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'view/date_screen.dart';
import 'view/detail_category.dart';
import 'view/login_screen.dart';
import 'view/main_screen.dart';
import 'view/profile_screen.dart';
import 'view/news_screen.dart';
import 'view/signup_screen.dart';
import 'view/home_screen.dart';
import 'view/onboarding_page.dart';
import 'view/splash_screen.dart';

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
          return null;
        },
      ),
    );
  }
}
