import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';


  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: 0.5, color: AppColor.primaryColor),
    );
  }