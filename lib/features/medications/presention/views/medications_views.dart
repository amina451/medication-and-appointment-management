import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/helper_functions/custom_build_show_modal.dart';
import 'package:pharmacy_app/core/widgets/build_app_bar.dart';
import 'package:pharmacy_app/core/widgets/custom_floating_button.dart';
import 'package:pharmacy_app/features/medications/presention/views/widgets/medications_view_body.dart';

class MedicationsView extends StatelessWidget {
  const MedicationsView({super.key});

  static const String routeName = 'MedicationsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          customBuildShowModalSheet(
            context,
            () {},
            'Name Medication',
            'Date',
            "N.Medication",
            "1",
            "Number",
            "2",
            "Date", 
            "Date",
            "Date",
          );
        },
      ),
      appBar: buildAppBar(context, "Medications"),
      body: MedicationsViewBody(),
    );
  }
}


