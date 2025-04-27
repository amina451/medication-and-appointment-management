import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/features/doctors/presention/views/doctors_view.dart';
import 'package:pharmacy_app/features/home/presention/view/home_view.dart';
import 'package:pharmacy_app/features/medications/presention/views/medications_views.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});


  static const String routeName = 'CustomBottomNavBar';
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  final List<Color> _selectedColors = [
    Colors.blueAccent.withOpacity(0.65),
    Colors.pinkAccent.withOpacity(0.65),
    Colors.greenAccent.withOpacity(0.65),
    Colors.purple,
  ];

  final List<Widget> _selectedPage = [
     HomeView(),
    const DoctorsView(),
    const MedicationsView(),
     HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _selectedPage,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            currentIndex: _currentIndex,
            selectedItemColor: _selectedColors[_currentIndex],
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.assetsImagesHomeIcon,
                  color: _currentIndex == 0 ? _selectedColors[0] : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.assetsImagesDoctorhand,
                  color: _currentIndex == 1 ? _selectedColors[1] : Colors.grey,
                ),
                label: 'Doctors',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  height: 35.h,
                  AppImages.assetsImagesSyringe,
                  color: _currentIndex == 2 ? _selectedColors[2] : Colors.grey,
                ),
                label: 'Medications',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.assetsImagesCalendar,
                  color: _currentIndex == 3 ? _selectedColors[3] : Colors.grey,
                ),
                label: 'M.schedule',
              ),
            ],
          ),
        ),
      ),
    );
  }
}