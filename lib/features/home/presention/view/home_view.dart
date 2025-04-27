import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';

import 'package:pharmacy_app/features/home/presention/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'home_view';

  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightPrimaryColor,
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
