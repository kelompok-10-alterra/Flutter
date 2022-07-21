import 'package:flutter/material.dart';

import '../animation/shimmer_effect.dart';
import '../model/type_model.dart';
import '../theme/theme.dart';

class CategoryStyle extends StatelessWidget {
  const CategoryStyle({
    Key? key,
    required this.type,
  }) : super(key: key);

  final TypeModel type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: defaultCardShadow,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                type.imageUrl!,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: ShimmerEffect(
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: greyColor,
                          boxShadow: defaultCardShadow,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                type.name!,
                style: blackTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: semiBold,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
