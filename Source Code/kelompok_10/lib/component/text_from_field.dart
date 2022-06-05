// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CostumTextFromField extends StatelessWidget {
  CostumTextFromField({
    Key? key,
    this.controllers,
    this.keyboardTypes,
    this.hintTexts,
    this.validators,
    this.onChangeds,
  }) : super(key: key);

  TextEditingController? controllers;
  TextInputType? keyboardTypes;
  String? hintTexts;
  String? Function(String?)? validators;
  Function(String?)? onChangeds;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: controllers,
      keyboardType: keyboardTypes,
      style: whiteTextStyle.copyWith(
        fontSize: 18.0,
        fontWeight: medium,
      ),
      decoration: InputDecoration(
        fillColor:greyColor.withOpacity(0.8),
        filled: true,
        hintStyle: whiteTextStyle.copyWith(
          fontSize: 18.0,
          fontWeight: regular,
        ),
        errorStyle: redTextStyle.copyWith(
          fontSize: 12.0,
          fontWeight: regular,
        ),
        hintText: hintTexts,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 19.0),
      ),
      validator: validators,
      onSaved: onChangeds,
    );
  }
}
