import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/features/date/presentaions/views/date_view.dart';
import 'package:pharmacy_app/features/doctors/presention/views/doctors_view.dart';
import 'package:pharmacy_app/features/home/presention/view/home_view.dart';
import 'package:pharmacy_app/features/medications/presention/views/medications_views.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/Perescarptions_view.dart';

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
    AppColor.primaryColor,
  ];

  final List<Widget> _selectedPage = [
    HomeView(),
    const DoctorsView(),
    const MedicationsView(),
    DateView(),
    PerescarptionsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _selectedPage),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
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
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 0 ? _selectedColors[0] : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.assetsImagesDoctorhand,
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 1 ? _selectedColors[1] : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Médecins',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.assetsImagesSyringe,
                  height: 35.h,
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 2 ? _selectedColors[2] : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Médicaments',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.assetsImagesCalendar,
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 3 ? _selectedColors[3] : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Rendez-vous',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.assetsImagesMedicalPrescriptionSvgrepoCom,
                  height: 35.h,
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 4 ? _selectedColors[4] : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Ordonnances',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
