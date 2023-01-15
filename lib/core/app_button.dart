import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/app_color.dart';
import 'package:medical_app/core/app_text.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final double? width;
  final Function onpressed;

  const AppButton({
    super.key,
    required this.buttonText,
    this.width,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpressed();
      },
      child: Container(
        height: 50.h,
        width: width,
        decoration: BoxDecoration(
          color: AppColor.buttoncolor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(color: AppColor.buttoncolor, blurRadius: 5),
          ],
        ),
        child: Center(
          child: AppText(
            fontsize: 16.sp,
            text: buttonText,
            color: const Color(0xffFBBF71),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
