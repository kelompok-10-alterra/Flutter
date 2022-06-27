import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kelompok_10/component/back_button.dart';

import '../component/card_recent_search.dart';
import '../component/search_text_input.dart';
import '../theme/theme.dart';

class OnSearchScreen extends StatefulWidget {
  static const routeName = '/on_search_screen';
  const OnSearchScreen({Key? key}) : super(key: key);

  @override
  State<OnSearchScreen> createState() => _OnSearchScreenState();
}

class _OnSearchScreenState extends State<OnSearchScreen> {
  final TextEditingController searchController = TextEditingController();

  Widget content() {
    return Column(
      children: [
        const SizedBox(
          height: 32.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              BackButtons(),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: SearchTextInput(
                  autoFocus: true,
                  hintText: 'Mau Olahraga apa hari ini?',
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
                  return const CardRecentSearch();
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
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          content(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
