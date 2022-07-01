import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CostumStapper extends StatelessWidget {
  final String tittle;
  final double width;
  final dynamic totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;

  const CostumStapper({
    Key? key,
    required this.tittle,
    required this.width,
    required this.curStep,
    required this.stepCompleteColor,
    required this.currentStepColor,
    required this.inactiveColor,
    required this.lineWidth,
    this.totalSteps,
  })  : assert(curStep > 0 == true && curStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List stepTitle = [
      'Pilih metode',
      'Bayar',
      'Selesai',
    ];
    return Container(
      padding: EdgeInsets.only(
        top: 20.0,
        left: defaultMargin,
        right: defaultMargin,
      ),
      width: width,
      child: Row(
        children: _steps(),
      ),
    );
  }

  getCircleColor(i) {
    Color color;
    if (i + 1 < curStep) {
      color = stepCompleteColor;
    } else if (i + 1 == curStep) {
      color = currentStepColor;
    } else {
      color = primaryColor;
    }
    return color;
  }

  getLineColor(i) {
    var color = curStep > i + 1
        ? greenColor.withOpacity(0.4)
        : greyColor.withOpacity(0.4);
    return color;
  }

  getTextColor(i) {
    Color color;
    if (i + 1 < curStep) {
      color = greyColor;
    } else if (i + 1 == curStep) {
      color = blackColor;
    } else {
      color = greyColor;
    }
    return color;
  }

  getText(i) {
    if (i == 0) {
      return 'Pilih metode';
    } else if (i == 2) {
      return 'Bayar';
    } else {
      return 'Selesai';
    }
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
      //colors according to state

      var circleColor = getCircleColor(i);
      var lineColor = getLineColor(i);

      // step circles
      list.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 24.0,
                width: 24.0,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
                child: getInnerElementOfStepper(i)),
            const SizedBox(
              width: 6.0,
            ),
            Text(
              getText(i).toString(),
              style: greyTextStyle.copyWith(
                color: getTextColor(i),
                fontSize: 14.0,
                fontWeight: regular,
              ),
            )
          ],
        ),
      );

      //line between step circles
      if (i != totalSteps - 1) {
        list.add(
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              height: lineWidth,
              decoration: BoxDecoration(
                color: lineColor,
                borderRadius: BorderRadius.circular(
                  2.0,
                ),
              ),
            ),
          ),
        );
      }
    }

    return list;
  }

  Widget getInnerElementOfStepper(index) {
    if (index + 1 < curStep) {
      return const Icon(
        Icons.check,
        color: Colors.white,
        size: 16.0,
      );
    } else {
      return Center(
        child: Text(
          '${index + 1}',
          style: whiteTextStyle.copyWith(
            fontSize: 12,
            fontWeight: regular,
          ),
        ),
      );
    }
  }
}
