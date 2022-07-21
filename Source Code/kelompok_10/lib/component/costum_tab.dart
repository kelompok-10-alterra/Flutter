import 'package:flutter/material.dart';

import 'package:kelompok_10/theme/theme.dart';

class CostumTab extends StatelessWidget {
  const CostumTab({
    Key? key,
    required this.labels,
  }) : super(key: key);

  final String labels;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 40.0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: blueColor,
            width: 2,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            labels,
          ),
        ),
      ),
    );
  }
}
