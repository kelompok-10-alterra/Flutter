import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompok_10/component/costum_tab.dart';
import 'package:kelompok_10/theme/theme.dart';

import '../component/card_gridview.dart';
import '../component/search_text_input.dart';

class DetailCategory extends StatefulWidget {
  static const routeName = '/detail_category';
  const DetailCategory({Key? key}) : super(key: key);

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory>
    with SingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  TabController? _tabController;

  Widget appBar() {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
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
                onPressed: () {
                  Navigator.pop(context);
                },
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
              hintText: 'Mau Olahraga apa hari ini?',
              searchController: searchController,
            ),
          ),
        ],
      ),
    );
  }

  Widget tabBars() {
    return Padding(
      padding: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: TabBar(
        physics: const BouncingScrollPhysics(),
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        isScrollable: true,
        labelColor: primaryColor,
        labelStyle: GoogleFonts.inter(
          fontSize: 12.0,
          fontWeight: regular,
        ),
        unselectedLabelColor: greyColor,
        indicator: BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(24),
        ),
        indicatorWeight: 0,
        tabs: contents.map(
          (e) {
            return CostumTab(
              labels: e,
            );
          },
        ).toList(),
      ),
    );
    // NOTE : BANNER
  }

  SliverAppBar header() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: whiteColor,
      titleSpacing: 0,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(82.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            appBar(),
            tabBars(),
          ],
        ),
      ),
    );
  }

  Widget semua() {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultMargin - 6.0,
        right: defaultMargin - 6.0,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          mainAxisExtent: 237.0,
        ),
        itemCount: 6,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox();
        },
      ),
    );
  }

  Widget isEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120.0,
            width: 120.0,
            child: SvgPicture.asset(
              'assets/svg/ic-class-empty.svg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'Sayang sekali, kelas belum tersedia!',
            style: blackTextStyle.copyWith(
              fontSize: 16.0,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            'Tetap pantau terus!',
            style: greyTextStyle.copyWith(
              fontSize: 14.0,
              fontWeight: regular,
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Padding(
      padding: EdgeInsets.only(bottom: defaultMargin),
      child: TabBarView(
        controller: _tabController,
        children: List.generate(
          contents.length,
          (index) => index != 0 ? isEmpty() : semua(),
        ),
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: contents.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            header(),
          ];
        },
        body: content(),
      ),
    );
  }
}

List contents = ['Semua', 'Kelas Offline', 'Kelas Online', 'Promo'];
