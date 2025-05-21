import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalender extends StatefulWidget {
  const CustomTableCalender({super.key});

  @override
  State<CustomTableCalender> createState() => _CustomTableCalenderState();
}

class _CustomTableCalenderState extends State<CustomTableCalender> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // دالة لتحديث اليوم المختار
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      color: AppColor.lightSecondryColor,
      child: TableCalendar(
        locale: 'fr_FR', // تغيير اللغة إلى الفرنسية
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: _onDaySelected,
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
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: AppColor.primaryColor,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: AppColor.hintColor,
            shape: BoxShape.circle,
          ),
          outsideDaysVisible: false, // إخفاء الأيام خارج الشهر الحالي
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: true,
          formatButtonShowsNext: false,

          // تنسيق التاريخ
          formatButtonDecoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          formatButtonTextStyle: TextStyle(color: Colors.white),
          titleTextStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ), // تحسين أسلوب العنوان
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
          weekendStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.red,
          ), // تمييز عطل نهاية الأسبوع
        ),
      ),
    );
  }
}
