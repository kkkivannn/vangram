import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/utils/formatter/formatter.dart';

final enterNumberFormKey = GlobalKey<FormState>();
final registrationFormKey = GlobalKey<FormState>();

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.onTap,
    this.enabled,
    this.inputFormatter,
    this.controller,
    this.readOnly = false,
    this.validator = _validator,
    this.maxLines,
    this.minLines,
    this.autoFocus = false,
    this.onChanged,
  })  : contentPadding = const EdgeInsets.symmetric(vertical: 20).copyWith(left: 20, right: 10),
        super(key: key);

  CustomTextField.message({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.onTap,
    this.enabled,
    this.inputFormatter,
    this.controller,
    this.readOnly = false,
    this.validator = _validator,
    this.maxLines,
    this.minLines,
    this.autoFocus = false,
    this.onChanged,
  }) : contentPadding = const EdgeInsets.symmetric(vertical: 15).copyWith(left: 20, right: 10);

  CustomTextField.number({
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.onTap,
    this.enabled,
    this.readOnly = false,
    this.inputFormatter,
    this.controller,
    this.validator = _validatorNumber,
    super.key,
    this.maxLines,
    this.minLines,
    this.autoFocus = false,
    this.onChanged,
  }) : contentPadding = const EdgeInsets.symmetric(vertical: 20).copyWith(left: 20, right: 10);

  CustomTextField.age({
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.onTap,
    this.enabled,
    this.readOnly = false,
    this.inputFormatter,
    this.controller,
    this.validator = _validatorAge,
    super.key,
    this.maxLines,
    this.minLines,
    this.autoFocus = false,
    this.onChanged,
  }) : contentPadding = const EdgeInsets.symmetric(vertical: 20).copyWith(left: 20, right: 10);

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final Function()? onTap;
  final bool? enabled;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String value)? onChanged;
  final int? maxLines;
  final int? minLines;
  final bool autoFocus;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      maxLines: maxLines,
      minLines: minLines,
      readOnly: readOnly,
      controller: controller,
      cursorColor: AppColors.kPrimaryColor,
      onTap: onTap,
      enabled: enabled,
      inputFormatters: inputFormatter,
      validator: validator,
      cursorErrorColor: AppColors.kPrimaryColor,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF9F9F9),
        isDense: true,
        isCollapsed: true,
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        errorStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        hintStyle: TextStyle(
          color: AppColors.kHintColor,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 50,
          minHeight: 30,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 50,
          minHeight: 30,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    )
        .animate()
        .slideY(
          begin: 1,
          end: 0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        )
        .fade(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
  }
}

String? _validator(String? value) {
  if (value == null || value.isEmpty) {
    return "Поле пустое";
  }
  return null;
}

String? _validatorAge(String? value) {
  if (value == null || value.isEmpty) {
    return "Поле пустое";
  } else if ((DateTime.now().year - dateFormat.parse(value).year) < 16) {
    return "Регистрация от 16 лет!";
  }
  return null;
}

String? _validatorNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "Поле пустое!";
  } else if (value.length < 18) {
    return "Номер введен не верно!";
  }
  log(value.length.toString());
  return null;
}
