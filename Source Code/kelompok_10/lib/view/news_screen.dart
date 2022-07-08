import 'package:flutter/material.dart';
import 'package:kelompok_10/animation/scale_animation.dart';
import 'package:kelompok_10/component/primary_button.dart';
import 'package:kelompok_10/view/login_screen.dart';
import 'package:kelompok_10/view_model/preferences_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = '/news_screen';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Screen'),
      ),
      body: Center(
        // Logo Flutter
        child: ScaleAnimations(
          child: PrimaryButton(
            press: () {},
          ),
        ), //F
      ),
    );
  }
}
