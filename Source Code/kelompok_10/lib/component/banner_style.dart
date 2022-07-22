import 'package:flutter/material.dart';

import '../model/news_letter_model.dart';
import '../theme/theme.dart';

class BannerStyle extends StatelessWidget {
  const BannerStyle({
    Key? key,
    required this.newsLetterModel,
  }) : super(key: key);

  final NewsLetterModel newsLetterModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: defaultMargin,
      ),
      child: Container(
        height: 120.0,
        width: displayWidth(context) * 0.87,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          // Radial Gradient
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              gradientOneColor,
              gradientTwoColor,
            ],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 6.0,
                  left: 12.0,
                  right: 12.0,
                  bottom: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsLetterModel.title ?? '',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18.0,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            newsLetterModel.description ?? '',
                            style: whiteTextStyle.copyWith(
                              fontSize: 12.0,
                              fontWeight: regular,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: displayWidth(context) * 0.3,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                child: newsLetterModel.imageUrl!.isNotEmpty
                    ? Image.network(
                        newsLetterModel.imageUrl!,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'assets/images/banner-one.png',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
