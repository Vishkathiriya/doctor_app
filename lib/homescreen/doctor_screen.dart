import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/app_button.dart';
import 'package:medical_app/core/app_color.dart';
import 'package:medical_app/core/app_image.dart';
import 'package:medical_app/core/app_text.dart';
import 'package:medical_app/core/behaviour.dart';
import 'package:medical_app/homescreen/appointment_screen.dart';
import 'package:medical_app/widgets/custom_textfield.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      body: Column(
        children: [topappbar(), SizedBox(height: 20.h), doctorList()],
      ),
    );
  }

  Widget topappbar() {
    return Container(
      height: MediaQuery.of(context).size.height / 4.2.h,
      width: double.infinity,
      color: AppColor.appcolor,
      child: Padding(
        padding: EdgeInsets.only(top: 60.h, left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColor.whitecolor,
                ),
                SizedBox(width: 15.w),
                AppText(
                  text: 'DOCTORS',
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
            SizedBox(height: 25.h),
            searchTextfield(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget searchTextfield() {
    return AppTextFormField(
      controller: searchController,
      focusNode: searchNode,
      prefixIcon: const Icon(
        Icons.search,
      ),
      label: 'Search',
      hint: 'Search',
      obscureText: false,
    );
  }

  Widget doctorList() {
    return Expanded(
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.whitecolor,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 1),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: 'DOCTOR NEARBY',
                              fontsize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.blackcolor,
                            ),
                            AppText(
                              text: 'SEE ALL',
                              fontsize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColor.seealltext,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
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
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                AppText(
                                  text: 'Total fee',
                                  fontsize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.hintText,
                                ),
                                SizedBox(height: 5.h),
                                AppText(
                                  text: '\$80',
                                  fontsize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.blackcolor,
                                ),
                              ],
                            ),
                            AppButton(
                              buttonText: 'Make an appointment',
                              onpressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const AppointmentScreen();
                                  },
                                ));
                              },
                              width: MediaQuery.of(context).size.width / 1.5.w,
                            )
                          ],
                        ),
                        SizedBox(height: 25.h),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
