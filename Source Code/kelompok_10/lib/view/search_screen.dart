import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/card_recent_search.dart';
import '../component/search_text_input.dart';
import '../theme/theme.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = '/news_screen';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Screen'),),
    );
  }


}
