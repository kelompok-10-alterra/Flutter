import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:kelompok_10/component/button_love.dart';
import 'package:kelompok_10/component/small_button.dart';

import '../model/class_model.dart';
import '../theme/theme.dart';

class CardGridView extends StatelessWidget {
  const CardGridView({
    Key? key,
    required this.classData,
  }) : super(key: key);

  final ClassModel classData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6.0, left: 6.0, right: 6.0),
      width: displayWidth(context) * 0.5,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: defaultCardShadow,
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
                    child: classData.imageUrl != null
                        ? Image.network(
                            classData.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 80.0,
                                      child: SvgPicture.asset(
                                        'assets/svg/il-empty.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      'Yah Gambarnya Gak Ada',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Image.asset(
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
                  classData.name ?? 'Nama Kelas',
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
                  'Mulai ${classData.schedule.toString()}',
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
                        'Rp. ${classData.price.toString()}',
                        style: redTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: semiBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      classData.categoryName!,
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
    );
  }
}
