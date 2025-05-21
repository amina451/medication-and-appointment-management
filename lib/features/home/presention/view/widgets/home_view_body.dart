import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/helper_functions/alert_dialog_for_exit.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/date/presentaions/views/date_view.dart';
import 'package:pharmacy_app/features/doctors/presention/views/doctors_view.dart';
import 'package:pharmacy_app/features/home/presention/view/widgets/custom_card_item.dart';
import 'package:pharmacy_app/features/medications/presention/views/medications_views.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/Perescarptions_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),

            GestureDetector(
               onTap: () async {
                  showLogoutAlert(context);
                  },
              child: Row(
                spacing: 7.w,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Déconnexion",
                    style: AppTextStyle.semiBold20.copyWith(
                      color: Colors.red.shade500,
                    ),
                  ),
                  Icon(
                    Icons.exit_to_app,
                    size: 24.w,
                    color: Colors.red.shade500,
                  ),
                ],
              ),
            ),
            Text("Que cherchez-vous ?", style: AppTextStyle.semiBold24),
            CustomCardItemHome(
              onTap: () {
                Navigator.pushNamed(context, DoctorsView.routeName);
              },
              colorIcon: Colors.pinkAccent.withOpacity(0.65),
              title: 'Médecins',
              subTitle: "Voici les médecins que vous \navez consultés",
              imagePath: AppImages.assetsImagesDoctorhand,
              colorTitle: Colors.pinkAccent.withOpacity(0.65),
            ),
            CustomCardItemHome(
              onTap: () {
                Navigator.pushNamed(context, MedicationsView.routeName);
              },
              title: 'Mes Médicaments',
              subTitle: "Suivez et gérez vos \nmédicaments personnels",
              imagePath: AppImages.assetsImagesSyringe,
              colorTitle: Colors.blueAccent.withOpacity(0.65),
              colorIcon: Colors.blueAccent.withOpacity(0.65),
            ),
            CustomCardItemHome(
              onTap: () {
                Navigator.pushReplacementNamed(context, DateView.routeName);
              },
              title: 'Rendez-vous du Médecin',
              subTitle: "Consultez et gérez votre \nplanning médical",
              imagePath: AppImages.assetsImagesCalendar,
              colorTitle: Colors.greenAccent.withOpacity(0.65),
              colorIcon: Colors.greenAccent.withOpacity(0.65),
            ),

            CustomCardItemHome(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  PerescarptionsView.routeName,
                );
              },
              title: 'prescreptions',
              subTitle: "Consultez et gérez vos \nprescreptions",
              imagePath: AppImages.assetsImagesMedicalPrescriptionSvgrepoCom,
              colorTitle: AppColor.primaryColor,
              colorIcon: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
