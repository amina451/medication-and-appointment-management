import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/home/presention/widgets/custom_card_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20.sp,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("What are you looking for?", style: AppTextStyle.semiBold24),
          CustomCardItem(
             onTap: () {
              Navigator.pushReplacementNamed(context, '/medication');
            },
            colorIcon: Colors.pinkAccent.withOpacity(0.65),
            title: 'Doctors',
            subTitle: "Here are the doctors you've visited",
            imagePath: AppImages.assetsImagesDoctorhand,
            colorTitle: Colors.pinkAccent.withOpacity(0.65),
          ),


          CustomCardItem(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/medication');
            },
            title: 'My Medications',
            subTitle: "Track and manage your \npersonal medications",
            imagePath: AppImages.assetsImagesSyringe,
            colorTitle: Colors.blueAccent.withOpacity(0.65),
            colorIcon: Colors.blueAccent.withOpacity(0.65),
          ),

          CustomCardItem(
             onTap: () {
              Navigator.pushReplacementNamed(context, '/medication');
            },
            title: 'Medication Schedule',
            subTitle: "View and manage your \nmedication schedule",
            imagePath: AppImages.assetsImagesCalendar,
            colorTitle: Colors.greenAccent.withOpacity(0.65),
            colorIcon: Colors.greenAccent.withOpacity(0.65),
          ),
        ],
      ),
    );
  }
}
