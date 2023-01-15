import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/app_color.dart';
import 'package:medical_app/core/app_image.dart';
import 'package:medical_app/core/app_text.dart';
import 'package:medical_app/core/behaviour.dart';
import 'package:medical_app/homescreen/doctor_screen.dart';
import 'package:medical_app/widgets/custom_textfield.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool isLoading = true;
  int selectedIndex = 0;
  // ignore: prefer_typing_uninitialized_variables
  var data;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      body: Column(
        children: [
          topappbar(),
          SizedBox(height: 20.h),
          serviceList(),
          SizedBox(height: 20.h),
          dailyupdatesText(),
          dailyupdates()
        ],
      ),
    );
  }

  Widget topappbar() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4.h,
      width: double.infinity,
      color: AppColor.appcolor,
      child: Padding(
        padding: EdgeInsets.only(top: 60.h, left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.health_and_safety_outlined,
                            color: AppColor.yellowcolor),
                        SizedBox(width: 8.w),
                        AppText(
                          text: 'Hello,',
                          fontsize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whitecolor,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: AppText(
                        text: 'George Floyd',
                        fontsize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whitecolor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  '${AppImages.images}profile.png',
                  height: 50.h,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            searchTextfield(),
            SizedBox(height: 10.h),
            tableCalendar()
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

  Widget tableCalendar() {
    return TableCalendar(
      calendarStyle: const CalendarStyle(
        todayTextStyle: TextStyle(color: AppColor.appcolor),
        defaultTextStyle: TextStyle(color: AppColor.whitecolor),
        outsideTextStyle: TextStyle(color: AppColor.whitecolor),
        weekendTextStyle: TextStyle(color: AppColor.whitecolor),
        selectedTextStyle: TextStyle(color: AppColor.tableColor),
        selectedDecoration:
            BoxDecoration(color: AppColor.whitecolor, shape: BoxShape.circle),
        todayDecoration:
            BoxDecoration(color: AppColor.whitecolor, shape: BoxShape.circle),
        defaultDecoration:
            BoxDecoration(color: AppColor.tableColor, shape: BoxShape.circle),
        weekendDecoration:
            BoxDecoration(color: AppColor.tableColor, shape: BoxShape.circle),
      ),
      headerStyle: HeaderStyle(
        titleTextStyle: TextStyle(
            color: AppColor.whitecolor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500),
        formatButtonVisible: false,
        titleCentered: true,
      ),
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarFormat: _calendarFormat,
      daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.white),
          weekendStyle: TextStyle(color: Colors.white)),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            // getSchdules(context, _focusedDay);
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  Widget serviceList() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.whitecolor,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 1),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        child: Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'SERVICES',
                    fontsize: 15.sp,
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
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80.h,
                        decoration: const BoxDecoration(
                            color: AppColor.containercolor,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: AppColor.appcolor,
                                        shape: BoxShape.circle),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.ac_unit,
                                        size: 35.sp,
                                        color: AppColor.whitecolor,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      AppText(
                        text: 'Covid-19',
                        fontsize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackcolor,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const DoctorScreen();
                        },
                      ));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 80.h,
                          decoration: const BoxDecoration(
                              color: AppColor.containercolor,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          color: AppColor.appcolor,
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.person,
                                          size: 35.sp,
                                          color: AppColor.whitecolor,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        AppText(
                          text: 'Doctor',
                          fontsize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackcolor,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 80.h,
                        decoration: const BoxDecoration(
                            color: AppColor.containercolor,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: AppColor.appcolor,
                                        shape: BoxShape.circle),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.local_hospital,
                                        size: 35.sp,
                                        color: AppColor.whitecolor,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      AppText(
                        text: 'Hospitals',
                        fontsize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackcolor,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 80.h,
                        decoration: const BoxDecoration(
                            color: AppColor.containercolor,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: AppColor.appcolor,
                                        shape: BoxShape.circle),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.medication_outlined,
                                        size: 35.sp,
                                        color: AppColor.whitecolor,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      AppText(
                        text: 'Medicines',
                        fontsize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackcolor,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget dailyupdatesText() {
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
            EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: 'DAILY UPDATE',
              fontsize: 15.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.blackcolor,
            ),
            const Icon(Icons.more_vert_rounded)
          ],
        ),
      ),
    );
  }

  Widget dailyupdates() {
    return Expanded(
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.whitecolor,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, blurRadius: 1),
          ],
        ),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 15.w, right: 15.w, top: 15.h, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Symptoms of Covid to \nwatch out for',
                            fontsize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackcolor,
                          ),
                          SizedBox(height: 10.h),
                          AppText(
                            text: 'August 09 - 08.23 AM',
                            fontsize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.hintText,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Image.asset(
                          '${AppImages.images}news.png',
                          height: 50.h,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

//   Widget service() {
//     return Expanded(
  // child: ListView.builder(
  //     scrollDirection: Axis.horizontal,
  //     padding: EdgeInsets.zero,
  //     itemCount: 3,
  //     itemBuilder: (context, index) {
  //       return Column(
//               children: [
//                 Container(
//                   height: 80.h,
//                   decoration: const BoxDecoration(
//                       color: AppColor.containercolor, shape: BoxShape.circle),
//                   child: Padding(
//                     padding: const EdgeInsets.all(11.0),
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: Container(
//                               decoration: const BoxDecoration(
//                                   color: AppColor.appcolor,
//                                   shape: BoxShape.circle),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Icon(
//                                   Icons.ac_unit,
//                                   size: 35.sp,
//                                   color: AppColor.whitecolor,
//                                 ),
//                               )),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10.h),
//                 AppText(
//                   text: 'Covid-19',
//                   fontsize: 13.sp,
//                   fontWeight: FontWeight.w600,
//                   color: AppColor.blackcolor,
//                 ),
//               ],
//             );
//           }),
//     );
//   }
// }
}
