import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        
       
      },
      backgroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: const Icon(Icons.add, color: Colors.white, size: 30),
    );
  }
}



