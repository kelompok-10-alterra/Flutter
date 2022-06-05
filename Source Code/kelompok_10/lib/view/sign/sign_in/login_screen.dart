import 'package:flutter/material.dart';

import '../../../component/primary_button.dart';
import '../../../component/text_button.dart';
import '../../../component/text_from_field.dart';
import '../../../component/text_from_field_pw.dart';
import '../../../theme/theme.dart';
import '../sign_up/signup_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sign_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: transparentColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Form(
              key: formGlobalKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo-with-txt.png',
                        height: 55.0,
                      ),
                      const SizedBox(
                        height: 52.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hai!',
                          style: whiteTextStyle.copyWith(
                            fontSize: 24.0,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      CostumTextFromField(
                        controllers: _emailController,
                        keyboardTypes: TextInputType.emailAddress,
                        hintTexts: 'Email',
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      CostumTextFromFieldPW(
                        controllers: _passwordController,
                        hintTexts: 'Password',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Lupa Kata Sandi?',
                          style: whiteTextStyle.copyWith(
                            fontSize: 14.0,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      PrimaryButton(
                        press: () {},
                        text: 'Masuk',
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum punya akun? ',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextButtons(
                            text: "Daftar",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
