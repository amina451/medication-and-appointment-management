import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/helper_functions/custom_build_show_modal.dart';
import 'package:pharmacy_app/core/widgets/build_app_bar.dart';
import 'package:pharmacy_app/core/widgets/custom_floating_button.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/doctor_view_body.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  static const String routeName = 'DoctorsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          customBuildShowModalSheet(
            context,
            () {},
            'Name Doctor',
            'Date',
            "N.Doctor",
            "EXP",
            "EXP",
          );
        },
      ),
      appBar: buildAppBar(context, "Doctors"),
      body: DoctorsViewBody(),
    );
  }
}
