// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/theme.dart';

class CostumTextFromField extends StatefulWidget {
  CostumTextFromField({
    Key? key,
    this.controllers,
    this.keyboardTypes,
    this.hintTexts,
    this.validators,
    this.onChangeds,
    this.prefixIcons,
    this.prefixColors,
    this.focusNode,
    this.textInputAction,
  }) : super(key: key);

  TextEditingController? controllers;
  TextInputType? keyboardTypes;
  String? hintTexts;
  String? Function(String?)? validators;
  Function(String?)? onChangeds;
  String? prefixIcons;
  Color? prefixColors;
  FocusNode? focusNode;
  TextInputAction? textInputAction;

  @override
  State<CostumTextFromField> createState() => _CostumTextFromFieldState();
}

class _CostumTextFromFieldState extends State<CostumTextFromField> {
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
        maxLines: 1,
        controller: widget.controllers,
        keyboardType: widget.keyboardTypes,
        style: blackTextStyle.copyWith(
          fontSize: 16.0,
          fontWeight: regular,
        ),
        decoration: InputDecoration(
          fillColor: whiteTwoColor,
          filled: true,
          hintStyle: greyTwoTextStyle.copyWith(
            fontSize: 16.0,
            fontWeight: regular,
          ),
          errorStyle: redTextStyle.copyWith(
            fontSize: 12.0,
            fontWeight: regular,
          ),
          hintText: widget.hintTexts,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
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
          prefixIcon: SvgPicture.asset(
            '${widget.prefixIcons}',
            color: widget.prefixColors,
            height: 22.0,
            fit: BoxFit.scaleDown,
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
