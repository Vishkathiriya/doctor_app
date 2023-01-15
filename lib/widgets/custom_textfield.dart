import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/core/app_color.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    Key? key,
    this.validator,
    onChanged,
    this.isObscure = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = true,
    this.readOnly = false,
    this.controller,
    this.inputAction,
    this.focusNode,
    required this.label,
    this.hint = "",
    this.onTap,
    this.prefix,
    this.maxLength,
    this.suffixIcon,
    this.keyboardtype,
    this.autofillHints,
    this.inputFormatters,
    this.prefixIcon,
    required this.obscureText,
    this.onFieldSubmitted,
  }) : super(key: key);
  TextEditingController? controller;
  final TextInputAction? inputAction;
  final String label;
  final String hint;
  final bool isObscure;
  final bool isCapitalized;
  final int maxLines;
  final int? maxLength;
  bool obscureText = false;
  final bool isLabelEnabled;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final Widget? suffixIcon;
  // ignore: prefer_typing_uninitialized_variables
  final keyboardtype;

  final Widget? prefix;
  final Widget? prefixIcon;
  final bool autofocus = false;
  // ignore: prefer_typing_uninitialized_variables
  final onTap;
  // ignore: prefer_typing_uninitialized_variables
  final autofillHints;
  final FocusNode? focusNode;
  List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        autofillHints: autofillHints,
        cursorColor: AppColor.blackcolor,
        onTap: onTap,
        maxLines: maxLines,
        maxLength: maxLength,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        controller: controller,
        readOnly: readOnly,
        autofocus: false,
        keyboardType: keyboardtype,
        textInputAction: TextInputAction.next,
        textCapitalization:
            isCapitalized ? TextCapitalization.words : TextCapitalization.none,
        style: const TextStyle(color: AppColor.blackcolor),
        validator: validator,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintStyle: GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: AppColor.hintText),
            counterText: '',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.0),
            ),
            fillColor: AppColor.whitecolor,
            filled: true),
      ),
    );
  }
}
