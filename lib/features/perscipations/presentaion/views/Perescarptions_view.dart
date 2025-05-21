import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/home/presention/view/widgets/custom_nav_bar.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/pres_body.dart';

class PerescarptionsView extends StatelessWidget {
  const PerescarptionsView({super.key});

  static const routeName = "PerescarptionsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context,CustomBottomNavBar.routeName);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: PerescarptionsViewBody());
  }
}
