import 'package:flutter/material.dart';

import '../../component/primary_button.dart';
import '../../component/text_button.dart';
import '../../component/text_from_field.dart';
import '../../component/text_from_field_pw.dart';
import '../../theme/theme.dart';
import 'home_screen.dart';
import 'main_screen.dart';
import 'signup_screen.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = '/login';
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isChecked = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Form(
        key: formGlobalKey,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: displayHeight(context) * 0.15),
                Center(
                  child: Image.asset(
                    'assets/images/logo-blue-no-txt.png',
                    height: 70.0,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 54.0),
                      Text(
                        'Hai Sporters!',
                        style: blackTextStyle.copyWith(
                          fontSize: 28.0,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Lanjutkan menggunakan email dan\npassword yang sudah terdaftar!',
                        style: greyTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: defaultMargin),
                CostumTextFromField(
                  textInputAction: TextInputAction.next,
                  focusNode: _focusNodes[0],
                  controllers: _emailController,
                  keyboardTypes: TextInputType.emailAddress,
                  hintTexts: 'Email',
                  prefixIcons: 'assets/svg/ic-email.svg',
                  prefixColors:
                      _focusNodes[0].hasFocus ? primaryColor : greyColor,
                  validators: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&\U+0060*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                        .hasMatch(value)) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                  onChangeds: (value) {
                    _emailController.text = value!;
                  },
                ),
                SizedBox(height: defaultMargin),
                CostumTextFromFieldPW(
                  textInputAction: TextInputAction.done,
                  focusNode: _focusNodes[1],
                  controllers: _passwordController,
                  hintTexts: 'Password',
                  prefixIcons: 'assets/svg/ic-password.svg',
                  prefixColors:
                      _focusNodes[1].hasFocus ? primaryColor : greyColor,
                  suffixColors:
                      _focusNodes[1].hasFocus ? primaryColor : greyColor,
                  validators: (value) {
                    if (value!.isEmpty) {
                      return 'Password tidak boleh kosong';
                    } else if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }
                  },
                  onChangeds: (value) {
                    _emailController.text = value!;
                  },
                ),
                const SizedBox(height: 8.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Remember me
                      Row(
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: greyColor,
                            ),
                            child: SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: Checkbox(
                                value: _isChecked,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                activeColor: primaryColor,
                                splashRadius: 0.0,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Ingat saya',
                            style: greyTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                      TextButtons(
                        text: 'Lupa Password?',
                        press: () {
                          // Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                        },
                      ),
                    ]),
                const SizedBox(height: 32.0),
                PrimaryButton(
                  press: () {
                    if (formGlobalKey.currentState!.validate()) {
                      Navigator.pushNamed(context, MainScreen.routeName);
                    }
                  },
                  text: 'Masuk',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                // Already Account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: greyTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    TextButtons(
                      text: 'Daftar',
                      press: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultMargin,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: content(),
    );
  }
}
