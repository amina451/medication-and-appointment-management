import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/widgets/build_app_bar.dart';
import 'package:pharmacy_app/features/medications/presention/views/widgets/custom_floting_button_med.dart';
import 'package:pharmacy_app/features/medications/presention/views/widgets/medications_view_body.dart';

class MedicationsView extends StatelessWidget {
  const MedicationsView({super.key});

  static const String routeName = 'MedicationsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: CustomFloatingActionButtonMed(),

      appBar: buildAppBar(context, "Medications"),
      body: MedicationsViewBody(),
    );
  }
}
