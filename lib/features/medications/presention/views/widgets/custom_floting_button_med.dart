import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';

class CustomFloatingActionButtonMed extends StatelessWidget {
  const CustomFloatingActionButtonMed({super.key, });
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
         /* customBuildShowModalSheet(
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
          );*/
        },
      backgroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: const Icon(Icons.add, color: Colors.white, size: 30),
    );
  }

}