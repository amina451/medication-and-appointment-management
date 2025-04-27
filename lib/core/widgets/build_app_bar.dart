import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColor.lightSecondryColor,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Color(0xff677294),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    ),
    title: Text(
      'Doctors',
      style: AppTextStyle.semiBold20.copyWith(color: AppColor.primaryColor),
    ),
  );
}
