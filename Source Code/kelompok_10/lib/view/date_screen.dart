import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class DateScreen extends StatefulWidget {
  static const routeName = '/date-screen';
  const DateScreen({Key? key}) : super(key: key);

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Text(
          'You have pushed the button this many times:',
        ),
      ),
    );
  }
}
