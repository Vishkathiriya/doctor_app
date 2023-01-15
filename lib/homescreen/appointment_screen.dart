import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/app_button.dart';
import 'package:medical_app/core/app_color.dart';
import 'package:medical_app/core/app_image.dart';
import 'package:medical_app/core/app_text.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      body: Column(
        children: [
          topappbar(),
          SizedBox(height: 15.h),
          SingleChildScrollView(
            child: Column(
              children: [
                doctordetails(),
                SizedBox(height: 15.h),
                totalcost(),
                SizedBox(height: 15.h),
                paymentoption(),
                SizedBox(height: 15.h),
                button(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topappbar() {
    return Container(
      height: MediaQuery.of(context).size.height / 7.h,
      width: double.infinity,
      color: AppColor.appcolor,
      child: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 15.w, right: 15.w),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.whitecolor,
            ),
            SizedBox(width: 15.w),
            AppText(
              text: 'APPOINTMENT',
              fontsize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.whitecolor,
            ),
            const Spacer(),
            const Icon(
              Icons.assignment_late_outlined,
              color: AppColor.whitecolor,
            ),
          ],
        ),
      ),
    );
  }

  Widget doctordetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.whitecolor,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 1),
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 20.h),
        child: Row(
          children: [
            Image.asset(
              '${AppImages.images}profile.png',
              height: 80.h,
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Darrell Steward',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor,
                ),
                SizedBox(height: 10.h),
                AppText(
                  text: 'Darrell Steward',
                  fontsize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.hintText,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(
                      Icons.badge,
                      color: AppColor.appcolor,
                      size: 17.sp,
                    ),
                    SizedBox(width: 7.w),
                    AppText(
                      text: '3 year',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.hintText,
                    ),
                    SizedBox(width: 15.w),
                    Icon(
                      Icons.heart_broken_rounded,
                      color: Colors.pink,
                      size: 17.sp,
                    ),
                    SizedBox(width: 7.w),
                    AppText(
                      text: '92 %',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.hintText,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget totalcost() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.whitecolor,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 1),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Total Cost',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor,
                ),
                AppText(
                  text: '\$80',
                  fontsize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor,
                ),
              ],
            ),
            SizedBox(height: 7.h),
            AppText(
              text: 'Session free for 30 min',
              fontsize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.hintText,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'To Pay',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor,
                ),
                AppText(
                  text: '\$80',
                  fontsize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor,
                ),
              ],
            ),
            SizedBox(height: 15.h),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 15.h),
            Container(
              height: 45.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffEFF6FE),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.discount,
                      color: AppColor.appcolor,
                    ),
                    AppText(
                      fontsize: 15.sp,
                      text: 'Use promo code',
                      color: AppColor.blackcolor,
                      fontWeight: FontWeight.w600,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.blackcolor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }

  Widget paymentoption() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.whitecolor,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 1),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: 'Payment Options',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor,
                ),
                AppText(
                  text: '\$80',
                  fontsize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackcolor,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.whitecolor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.lens_rounded,
                          color: AppColor.appcolor,
                        ),
                        SizedBox(width: 15.w),
                        AppText(
                          fontsize: 15.sp,
                          text: 'PaypPal',
                          color: AppColor.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        Image.asset(
                          '${AppImages.images}paypal.png',
                          height: 25.h,
                        ),
                      ],
                    ),
                    Divider(thickness: 1, color: Colors.grey.shade300),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.lens_rounded,
                          color: AppColor.appcolor,
                        ),
                        SizedBox(width: 15.w),
                        AppText(
                          fontsize: 15.sp,
                          text: 'Credit Card',
                          color: AppColor.blackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        Image.asset(
                          '${AppImages.images}credit.png',
                          height: 25.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }

  Widget button() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
      child: AppButton(buttonText: 'Pay & Confirm', onpressed: () {}),
    );
  }
}
