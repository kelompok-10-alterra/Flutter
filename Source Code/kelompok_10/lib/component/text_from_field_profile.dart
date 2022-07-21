// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ProfileTextFromField extends StatefulWidget {
  ProfileTextFromField({
    Key? key,
    this.controllers,
    this.keyboardTypes,
    this.hintTexts,
    this.validators,
    this.onChangeds,
    this.focusNode,
    this.textInputAction,
    this.maxLines,
  }) : super(key: key);

  TextEditingController? controllers;
  TextInputType? keyboardTypes;
  String? hintTexts;
  String? Function(String?)? validators;
  Function(String?)? onChangeds;
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  int? maxLines;

  @override
  State<ProfileTextFromField> createState() => _ProfileTextFromFieldState();
}

class _ProfileTextFromFieldState extends State<ProfileTextFromField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: primaryColor,
            ),
      ),
      child: TextFormField(
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        maxLines: widget.maxLines ?? 1,
        controller: widget.controllers,
        keyboardType: widget.keyboardTypes,
        style: blackTextStyle.copyWith(
          fontSize: 16.0,
          fontWeight: regular,
        ),
        decoration: InputDecoration(
          fillColor: whiteTwoColor,
          filled: true,
          hintStyle: greyTextStyle.copyWith(
            fontSize: 16.0,
            fontWeight: regular,
          ),
          errorStyle: redTextStyle.copyWith(
            fontSize: 12.0,
            fontWeight: regular,
          ),
          hintText: widget.hintTexts,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: greyFourColor,
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        ),
        validator: widget.validators,
        onSaved: widget.onChangeds,
      ),
    );
  }
}
