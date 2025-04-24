import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';

import 'package:pharmacy_app/features/doctors/presention/views/widgets/build_app_bar.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_floating_button.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/doctor_view_body.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  static const String routeName = 'DoctorsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: CustomFloatingActionButton(),
      appBar: buildAppBar(context),
      body: DoctorsViewBody(),
    );
  }
}

