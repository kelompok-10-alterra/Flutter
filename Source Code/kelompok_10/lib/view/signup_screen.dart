import 'package:flutter/material.dart';

import '../component/primary_button.dart';
import '../component/text_button.dart';
import '../component/text_from_field.dart';
import '../component/text_from_field_pw.dart';
import '../theme/theme.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
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
                        'Gunakan data yang benar\nuntuk mendaftar',
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
                  controllers: _userNameController,
                  keyboardTypes: TextInputType.name,
                  hintTexts: 'Username',
                  prefixIcons: 'assets/svg/ic-username.svg',
                  prefixColors:
                      _focusNodes[0].hasFocus ? primaryColor : greyColor,
                  validators: (value) {
                    if (value!.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                  onChangeds: (value) {
                    _emailController.text = value!;
                  },
                ),
                SizedBox(height: defaultMargin),
                CostumTextFromField(
                  textInputAction: TextInputAction.next,
                  focusNode: _focusNodes[1],
                  controllers: _emailController,
                  keyboardTypes: TextInputType.emailAddress,
                  hintTexts: 'Email',
                  prefixIcons: 'assets/svg/ic-email.svg',
                  prefixColors:
                      _focusNodes[1].hasFocus ? primaryColor : greyColor,
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
                CostumTextFromField(
                  textInputAction: TextInputAction.next,
                  focusNode: _focusNodes[2],
                  controllers: _phoneController,
                  keyboardTypes: TextInputType.phone,
                  hintTexts: 'Nomor Telepon',
                  prefixIcons: 'assets/svg/ic-phone.svg',
                  prefixColors:
                      _focusNodes[2].hasFocus ? primaryColor : greyColor,
                  validators: (value) {
                    if (value!.isEmpty) {
                      return 'Nomor Telepon tidak boleh kosong';
                    } else if (value.length < 10) {
                      return 'Nomor Telepon tidak valid';
                    }
                    return null;
                  },
                  onChangeds: (value) {
                    _emailController.text = value!;
                  },
                ),
                SizedBox(height: defaultMargin),
                CostumTextFromFieldPW(
                  textInputAction: TextInputAction.next,
                  focusNode: _focusNodes[3],
                  controllers: _passwordController,
                  hintTexts: 'Password',
                  prefixIcons: 'assets/svg/ic-password.svg',
                  prefixColors:
                      _focusNodes[3].hasFocus ? primaryColor : greyColor,
                  suffixColors:
                      _focusNodes[3].hasFocus ? primaryColor : greyColor,
                  validators: (value) {
                    if (value!.isEmpty) {
                      return 'Password tidak boleh kosong';
                    } else if (value.length < 6) {
                      return 'Password minimal 6 karakter';
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
                  focusNode: _focusNodes[4],
                  controllers: _confirmPasswordController,
                  hintTexts: 'Konfirmasi Password',
                  prefixIcons: 'assets/svg/ic-password.svg',
                  prefixColors:
                      _focusNodes[4].hasFocus ? primaryColor : greyColor,
                  suffixColors:
                      _focusNodes[4].hasFocus ? primaryColor : greyColor,
                  validators: (value) {
                    if (value!.isEmpty) {
                      return 'Konfirmasi Password tidak boleh kosong';
                    } else if (value != _passwordController.text) {
                      return 'Konfirmasi Password tidak sama';
                    }
                    return null;
                  },
                  onChangeds: (value) {
                    _emailController.text = value!;
                  },
                ),

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
                      'Sudah punya akun? ',
                      style: greyTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    TextButtons(
                      text: 'Masuk',
                      press: () {
                        Navigator.pushNamed(context, LogInScreen.routeName);
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
