import 'package:flutter/material.dart';
import 'package:kelompok_10/animation/scale_animation.dart';

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
      body: const Center(
        // Logo Flutter
        child: ScaleAnimations(
          child: FlutterLogo(
            size: 300,
            textColor: Colors.blue,
            style: FlutterLogoStyle.stacked,
          ),
        ), //F
      ),
    );
  }
}
