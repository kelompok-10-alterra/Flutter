import 'package:flutter/material.dart';
import 'package:kelompok_10/view_model/class_view_model.dart';
import 'package:kelompok_10/view_model/newsletter_view_model.dart';
import 'package:kelompok_10/view_model/toast_view_model.dart';
import 'package:provider/provider.dart';

import 'animation/transition_animation.dart';
import 'model/member_model.dart';
import 'view/Payment_Membership/payment_screen.dart';
import 'view/cart_screen.dart';
import 'view/schedule_screen.dart';
import 'view/detail_akun_screen.dart';
import 'view/detail_class.dart';
import 'view/favorite_screen.dart';
import 'view/login_screen.dart';
import 'view/main_screen.dart';
import 'view/membership_detail.dart';
import 'view/membership_purchase.dart';
import 'view/on_search_screen.dart';

import 'view/point_screen.dart';
import 'view/profile_screen.dart';
import 'view/news_screen.dart';
import 'view/riwayat_pembelian_screen.dart';
import 'view/signup_screen.dart';
import 'view/home_screen.dart';
import 'view/onboarding_page.dart';
import 'view/splash_screen.dart';
import 'view_model/auth_view_model.dart';
import 'view_model/member_view_model.dart';
import 'view_model/payment_view_model.dart';
import 'view_model/preferences_viewmodel.dart';
import 'view_model/type_view_model.dart';

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
        ChangeNotifierProvider(
          create: (_) => TypeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClassViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => MemberViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PaymentViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ToastViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewsLetterViewModel(),
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
          if (setting.name == ScheduleScreen.routeName) {
            return FadeInRoute(
              page: const ScheduleScreen(),
            );
          }
          if (setting.name == ProfileScreen.routeName) {
            return FadeInRoute(
              page: const ProfileScreen(),
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
              page: MembershipDetail(
                member: setting.arguments as MemberModel,
              ),
            );
          }
          if (setting.name == PaymentScreen.routeName) {
            return FadeInRoute(
              page: PaymentScreen(
                member: setting.arguments as MemberModel,
              ),
            );
          }
          
          if (setting.name == DetailAkunScreen.routeName) {
            return FadeInRoute(
              page: const DetailAkunScreen(),
            );
          }
          if (setting.name == FavoriteScreen.routeName) {
            return FadeInRoute(
              page: const FavoriteScreen(),
            );
          }
          if (setting.name == RiwayatPembelianScreen.routeName) {
            return FadeInRoute(
              page: const RiwayatPembelianScreen(),
            );
          }
          if (setting.name == PointScreen.routeName) {
            return FadeInRoute(
              page: const PointScreen(),
            );
          }
          if (setting.name == CartScreen.routeName) {
            return FadeInRoute(
              page: const CartScreen(),
            );
          }
          return null;
        },
      ),
    );
  }
}
