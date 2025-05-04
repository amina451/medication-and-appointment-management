import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/date_view_body.dart';
import 'package:pharmacy_app/features/home/presention/view/home_view.dart';

class DateView extends StatelessWidget {
  const DateView({super.key});

  static const routeName = "DateView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context,HomeView.routeName);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: DateViewBody(),
    );
  }
}
