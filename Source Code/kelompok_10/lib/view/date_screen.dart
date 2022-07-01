import 'package:flutter/material.dart';
import 'package:kelompok_10/theme/theme.dart';

import '../component/primary_button.dart';
import '../component/stepper.dart';

class DateScreen extends StatefulWidget {
  static const routeName = '/date-screen';
  const DateScreen({Key? key}) : super(key: key);

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  List<String> stepTitle = [
    'Pilih metode',
    'Bayar',
    'Selesai',
  ];

  int currentStep = 1;
  int stepLength = 3;
  bool? complete;

  next() {
    if (currentStep <= stepLength) {
      goTo(currentStep + 1);
    }
  }

  back() {
    if (currentStep > 1) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
    if (currentStep > stepLength) {
      setState(() => complete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CostumStapper(
            tittle: 'cek',
            totalSteps: stepTitle.length,
            width: MediaQuery.of(context).size.width,
            curStep: currentStep,
            stepCompleteColor: greenColor,
            currentStepColor: greenColor,
            inactiveColor: orangeColor,
            lineWidth: 2.0,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: currentStep <= stepLength
                ? Text(
                    "Step $currentStep",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                  )
                : Text(
                    "Completed!",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                  ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          vertical: defaultMargin,
          horizontal: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: PrimaryButton(
                text: 'Kembali',
                press: () {
                  back();
                },
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: PrimaryButton(
                text: 'Lanjut',
                press: () {
                  next();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
