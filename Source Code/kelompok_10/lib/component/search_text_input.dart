import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class SearchTextInput extends StatelessWidget {
  const SearchTextInput({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      height: 50.0,
      decoration: BoxDecoration(
        color: greyThreeColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Center(
        child: TextField(
          style: blackTextStyle.copyWith(
            fontSize: 14.0,
            fontWeight: regular,
          ),
          controller: searchController,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SvgPicture.asset(
                'assets/svg/ic-search.svg',
                color: greyColor,
              ),
            ),
            hintText: 'Mau Olahraga apa hari ini?',
            hintStyle: greyTextStyle.copyWith(
              fontSize: 14.0,
              fontWeight: regular,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
