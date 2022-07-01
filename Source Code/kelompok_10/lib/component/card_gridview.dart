import 'package:flutter/material.dart';

import 'package:kelompok_10/component/button_love.dart';
import 'package:kelompok_10/component/small_button.dart';

import '../theme/theme.dart';
import '../view/detail_class.dart';

class CardGridView extends StatelessWidget {
  const CardGridView({
    Key? key,
    required this.tags,
  }) : super(key: key);

  final int tags;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailClass.routeName);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 6.0, left: 6.0, right: 6.0),
        width: displayWidth(context) * 0.5,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.23),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(
                0,
                0,
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: Image.asset(
                        'assets/images/human-two.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SmallButton(),
                          LoveButton(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Body Stretching sdsds sdsds',
                    style: blackTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: semiBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    '45 Menit | Menengah',
                    style: blackTextStyle.copyWith(
                      fontSize: 12.0,
                      fontWeight: medium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Rp. 30.000',
                          style: redTextStyle.copyWith(
                            fontSize: 14.0,
                            fontWeight: semiBold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        'Online',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: medium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
