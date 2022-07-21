// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/loading_button.dart';
import '../component/primary_button.dart';
import '../component/text_button.dart';
import '../component/text_from_field.dart';
import '../component/text_from_field_pw.dart';
import '../theme/theme.dart';
import '../view_model/auth_view_model.dart';
import 'login_screen.dart';

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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
    FocusNode(),
  ];

  signUpHandle(
      // BuildContext ctx,
      ) async {
    final signUp = Provider.of<AuthViewModel>(context, listen: false);
    if (formGlobalKey.currentState!.validate()) {
      // ignore: unrelated_type_equality_checks
      await signUp.register(
        _nameController.text.trim(),
        _userNameController.text.trim(),
        _emailController.text.trim(),
        _phoneController.text.trim(),
        _passwordController.text.trim(),
      );

      if (signUp.state == AuthState.hashdata &&
          signUp.confirmToken.isNotEmpty) {
        handleVerifEmail();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: redColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            content: Text(
              'Account already exist!',
              style: whiteTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }
  }

  handleVerifEmail() {
    final state = Provider.of<AuthViewModel>(context, listen: false);
    print(state.confirmToken);

    state.verifyEmail(state.confirmToken);

    print(state.checkVerif);
    if (state.checkVerif == 'Verify Success') {
      Navigator.pushReplacementNamed(
          context, LogInScreen.routeName);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
          backgroundColor: greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
          ),
          content: Text(
            'Verifikasi berhasil',
            style: whiteTextStyle.copyWith(
              fontSize: 14.0,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else if (state.checkVerif == 'Verify Fail') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: redColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
          ),
          content: Text(
            'Verifikasi Gagal',
            style: whiteTextStyle.copyWith(
              fontSize: 14.0,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

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
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: displayHeight(context) * 0.1),
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
                  controllers: _nameController,
                  keyboardTypes: TextInputType.name,
                  hintTexts: 'Name',
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
                  controllers: _userNameController,
                  keyboardTypes: TextInputType.name,
                  hintTexts: 'Username',
                  prefixIcons: 'assets/svg/ic-username.svg',
                  prefixColors:
                      _focusNodes[1].hasFocus ? primaryColor : greyColor,
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
                  focusNode: _focusNodes[2],
                  controllers: _emailController,
                  keyboardTypes: TextInputType.emailAddress,
                  hintTexts: 'Email',
                  prefixIcons: 'assets/svg/ic-email.svg',
                  prefixColors:
                      _focusNodes[2].hasFocus ? primaryColor : greyColor,
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
                  focusNode: _focusNodes[3],
                  controllers: _phoneController,
                  keyboardTypes: TextInputType.phone,
                  hintTexts: 'Nomor Telepon',
                  prefixIcons: 'assets/svg/ic-phone.svg',
                  prefixColors:
                      _focusNodes[3].hasFocus ? primaryColor : greyColor,
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
                  focusNode: _focusNodes[4],
                  controllers: _passwordController,
                  hintTexts: 'Password',
                  prefixIcons: 'assets/svg/ic-password.svg',
                  prefixColors:
                      _focusNodes[4].hasFocus ? primaryColor : greyColor,
                  suffixColors:
                      _focusNodes[4].hasFocus ? primaryColor : greyColor,
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
                  focusNode: _focusNodes[5],
                  controllers: _confirmPasswordController,
                  hintTexts: 'Konfirmasi Password',
                  prefixIcons: 'assets/svg/ic-password.svg',
                  prefixColors:
                      _focusNodes[5].hasFocus ? primaryColor : greyColor,
                  suffixColors:
                      _focusNodes[5].hasFocus ? primaryColor : greyColor,
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
                Consumer<AuthViewModel>(builder: (context, state, _) {
                  if (state.state == AuthState.loading) {
                    return const LoadingButton();
                  }
                  return PrimaryButton(
                    press: () {
                      signUpHandle();
                    },
                    text: 'Masuk',
                  );
                }),

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

