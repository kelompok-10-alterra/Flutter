// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kelompok_10/component/primary_button.dart';
import 'package:kelompok_10/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../component/back_button.dart';
import '../component/text_from_field_profile.dart';
import '../theme/theme.dart';

class DetailAkunScreen extends StatefulWidget {
  static const routeName = '/detail-akun-screen';
  const DetailAkunScreen({Key? key}) : super(key: key);

  @override
  State<DetailAkunScreen> createState() => _DetailAkunScreenState();
}

class _DetailAkunScreenState extends State<DetailAkunScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  AppBar header() {
    return AppBar(
      backgroundColor: whiteColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackButtons(
            height: 40.0,
            width: 40.0,
          ),
          Text(
            'Detail Akun',
            style: blackTextStyle.copyWith(
              fontSize: 20.0,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            width: 40,
          )
        ],
      ),
    );
  }

  Widget content() {
    return Consumer<AuthViewModel>(builder: (context, state, _) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: defaultMargin,
              ),
              Container(
                width: 112.0,
                height: 112.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                  border: Border.all(
                    color: greyFourColor,
                    width: 1.0,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/profile-img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: SvgPicture.asset(
                        'assets/svg/ic-edit-photo.svg',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Lengkap',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ProfileTextFromField(
                      hintTexts: state.user.name ?? 'Nama Tidak Diketahui',
                      keyboardTypes: TextInputType.text,
                      validators: (value) {
                        if (value!.isEmpty) {
                          return 'Nama Lengkap tidak boleh kosong';
                        }
                        return null;
                      },
                      onChangeds: (value) {
                        print(value);
                      },
                      controllers: nameController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Username',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ProfileTextFromField(
                      hintTexts:
                          state.user.username ?? 'Username Tidak Diketahui',
                      keyboardTypes: TextInputType.text,
                      validators: (value) {
                        if (value!.isEmpty) {
                          return 'Username tidak boleh kosong';
                        }
                        return null;
                      },
                      onChangeds: (value) {
                        print(value);
                      },
                      controllers: userNameController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Email',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ProfileTextFromField(
                      hintTexts: state.user.email ?? 'Email Tidak Diketahui',
                      keyboardTypes: TextInputType.emailAddress,
                      validators: (value) {
                        if (value!.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        return null;
                      },
                      onChangeds: (value) {
                        print(value);
                      },
                      controllers: emailController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Nomor Telepon',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ProfileTextFromField(
                      hintTexts:
                          state.user.phone ?? 'Nomor Telepon Tidak Diketahui',
                      keyboardTypes: TextInputType.phone,
                      validators: (value) {
                        return null;
                      },
                      onChangeds: (value) {
                        print(value);
                      },
                      controllers: phoneController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Alamat',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ProfileTextFromField(
                      hintTexts: state.user.address ?? 'Tambahkan Alamat',
                      maxLines: 5,
                      keyboardTypes: TextInputType.streetAddress,
                      validators: (value) {
                        return null;
                      },
                      onChangeds: (value) {
                        print(value);
                      },
                      controllers: addressController,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: defaultMargin,
              ),
              PrimaryButton(
                text: 'Simpan',
                press: () {
                  if (formGlobalKey.currentState!.validate()) {
                    formGlobalKey.currentState!.save();
                  }
                },
              ),
              SizedBox(
                height: defaultMargin,
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      backgroundColor: whiteColor,
      appBar: header(),
      body: content(),
    );
  }
}
