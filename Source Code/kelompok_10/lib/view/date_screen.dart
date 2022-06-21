import 'package:flutter/material.dart';

class DateScreen extends StatelessWidget {
  static const routeName = '/date-screen';
  const DateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date'),
      ),
    );
  }
}
