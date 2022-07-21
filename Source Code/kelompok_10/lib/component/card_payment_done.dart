import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CardPaymentDone extends StatelessWidget {
  const CardPaymentDone({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: greyTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: regular,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  style: blackTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: medium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
