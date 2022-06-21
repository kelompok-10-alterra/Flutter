import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompok_10/component/costum_tab.dart';
import 'package:kelompok_10/theme/theme.dart';

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
              searchController: searchController,
            ),
          ),
        ],
      ),
    );
  }

  Widget tabBars() {
    return Padding(
      padding: EdgeInsets.all(defaultMargin),
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
        preferredSize: const Size.fromHeight(112.0),
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

  Widget content() {
    return TabBarView(
      controller: _tabController,
      children: List.generate(
        contents.length,
        (index) => Container(
          child: Center(
            child: Text(contents[index]),
          ),
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
