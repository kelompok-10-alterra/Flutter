import 'package:flutter/material.dart';
import 'package:kelompok_10/animation/fade_animation.dart';
import 'package:kelompok_10/animation/scale_animation.dart';
import 'package:kelompok_10/component/primary_button.dart';
import 'package:kelompok_10/view_model/preferences_viewmodel.dart';
import 'package:kelompok_10/view_model/type_view_model.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = '/news_screen';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesViewModel>(builder: (context, stateToken, _) {
      return Consumer<TypeViewModel>(builder: (context, stateType, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('News Screen'),
          ),
          body: Center(
            // Logo Flutter
            child: FadeAnimation(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 20),
                  PrimaryButton(
                    press: () {
                      stateToken.getToken();

                      stateType.getAllType(stateToken.token.accessToken!);
                    },
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(stateType.type[index].name!),
                        );
                      },
                      itemCount: stateType.type.length),
                ],
              ),
            ), //F
          ),
        );
      });
    });
  }
}
