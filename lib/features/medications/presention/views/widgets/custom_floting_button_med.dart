
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/medications/presention/views/widgets/custom_build_show_modal_medication.dart';

class CustomFloatingActionButtonMed extends StatelessWidget {
  const CustomFloatingActionButtonMed({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'uniqueTag1',

      onPressed: () {
        customBuildShowModalSheetMed(context);
        
      },

      
      backgroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: const Icon(Icons.add, color: Colors.white, size: 30),
    );
  }
}
