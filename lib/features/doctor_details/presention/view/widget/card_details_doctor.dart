import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/doctor_details/presention/view/widget/custom_doctor_info_person.dart';
import 'package:pharmacy_app/features/doctor_details/presention/view/widget/custom_shedule.dart';
import 'package:pharmacy_app/features/doctor_details/presention/view/widget/experienceAndTartedAndHourlyRated.dart';
import 'package:pharmacy_app/features/doctor_details/presention/view/widget/starts_at.dart';
import 'package:pharmacy_app/features/doctors/presention/views/doctors_view.dart';

class CardDetailsDoctor extends StatelessWidget {
  const CardDetailsDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 721.h,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),

        child: Column(
          spacing: 20.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDoctorInfoPerson(),
            StartsAt(),
            SizedBox(height: 20.h),
            ExperienceAndTartedAndHourlyRated(),
            SizedBox(height: 20.h),

            Text(
              'Schedule',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 193.h, child: CustomSchedule()),
            Spacer(),
            Center(
              child: CustomButton(
                title: "Back Doctor",
                buttonTitleColor: Colors.white,
                buttonColor: AppColor.primaryColor,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    DoctorsView.routeName,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
