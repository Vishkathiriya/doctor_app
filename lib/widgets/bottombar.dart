import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/app_color.dart';
import 'package:medical_app/homescreen/appointment_screen.dart';
import 'package:medical_app/homescreen/doctor_screen.dart';
import 'package:medical_app/homescreen/home_screen.dart';

class BottombarPage extends StatefulWidget {
  const BottombarPage({super.key});

  @override
  State<BottombarPage> createState() => _BottombarPageState();
}

class _BottombarPageState extends State<BottombarPage> {
  bool keyboardOpen = false;

  int selectedIndex = 0;

  List widgetOptions = [
    const HomeScreen(),
    const AppointmentScreen(),
    const DoctorScreen(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColor.whitecolor,
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AppColor.whitecolor,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: selectedIndex != 0
                        ? Icon(Icons.home_sharp,
                            size: 30.sp, color: AppColor.hintText)
                        : Icon(Icons.home_sharp,
                            size: 30.sp, color: AppColor.buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: selectedIndex != 1
                        ? Icon(Icons.save,
                            size: 30.sp, color: AppColor.hintText)
                        : Icon(Icons.save,
                            size: 30.sp, color: AppColor.buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: selectedIndex != 2
                        ? Icon(Icons.calendar_month,
                            size: 30.sp, color: AppColor.hintText)
                        : Icon(Icons.calendar_month,
                            size: 30.sp, color: AppColor.buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: selectedIndex != 3
                        ? Icon(Icons.settings,
                            size: 30.sp, color: AppColor.hintText)
                        : Icon(Icons.settings,
                            size: 30.sp, color: AppColor.buttoncolor)),
              ],
            ),
          ),
        ),
        body: widgetOptions[selectedIndex],
      ),
    );
  }
}
