 import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';

AppBar buildAppBarDoctorDetails(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),    
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      title: Text("Doctor Details"),
    );
  }