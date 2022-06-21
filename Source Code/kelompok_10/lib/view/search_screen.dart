import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/card_recent_search.dart';
import '../component/search_text_input.dart';
import '../theme/theme.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  Widget content(context) {
    return Column(
      children: [
        const SizedBox(
          height: 32.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: greyThreeColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/ic-back.svg',
                      color: primaryColor,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: SearchTextInput(
                  searchController: searchController,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 32.0,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Riwayat Pencarian',
                    style: blackTextStyle.copyWith(
                      fontSize: 18.0,
                      fontWeight: semiBold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    'Hapus pencarian',
                    style: greyTwoTextStyle.copyWith(
                      fontSize: 12.0,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return CardRecentSearch();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [content(context)],
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
