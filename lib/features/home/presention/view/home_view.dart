import 'package:flutter/material.dart';

import 'package:pharmacy_app/features/home/presention/widgets/custom_nav_bar.dart';
import 'package:pharmacy_app/features/home/presention/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500.withOpacity(0.1),
      bottomNavigationBar: CustomBottomNavBar(),

      body: SafeArea(child: HomeViewBody()),
    );
  }
}

