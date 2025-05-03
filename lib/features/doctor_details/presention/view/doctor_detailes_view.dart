import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/doctor_details/presention/view/widget/build_app_bar_doctor_details.dart';
import 'package:pharmacy_app/features/doctor_details/presention/view/widget/doctor_detailes_view_body.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  static const routeName = "Doctor Details";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: buildAppBarDoctorDetails(context),
      body: DoctorDetailsViewBody(),
    );
  }

 
}
