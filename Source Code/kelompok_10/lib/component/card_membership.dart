import 'package:flutter/material.dart';

import '../model/member_model.dart';
import '../model/user_model.dart';
import '../theme/theme.dart';

class CardMembership extends StatelessWidget {
  const CardMembership({
    Key? key,
    required this.starColor,
    required this.endColor,
    required this.member,
    required this.user,
  }) : super(key: key);

  final Color starColor;
  final Color endColor;
  final MemberModel member;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        bottom: 16.0,
      ),
      height: 175.0,
      width: displayWidth(context),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            starColor,
            endColor,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0.0 - 26.0,
            left: 3.0,
            child: Container(
              height: 54.0,
              width: 54.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //border side
                border: Border.all(
                  color: whiteColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0 - 12.0,
            right: 0.0 - 30.0,
            child: Container(
              height: 54.0,
              width: 54.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //border side
                border: Border.all(
                  color: whiteColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0 - 48.0,
            right: 4.0,
            child: Container(
              height: 72.0,
              width: 72.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //border side
                border: Border.all(
                  color: whiteColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name!,
                  style: whiteTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Id Belum tersedia - ${member.name}',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      member.period!,
                      style: whiteTextStyle.copyWith(
                        fontSize: 12.0,
                        fontWeight: medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/card-logo.png',
                      height: 28.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
