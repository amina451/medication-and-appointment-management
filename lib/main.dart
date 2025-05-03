import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/helper_functions/material_route.dart';
import 'package:pharmacy_app/features/doctor_details/presention/view/doctor_detailes_view.dart';
import 'package:pharmacy_app/features/doctors/presention/views/doctors_view.dart';
import 'package:pharmacy_app/features/home/presention/widgets/custom_nav_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0.0,
              foregroundColor: Colors.white,

              backgroundColor: Colors.white,
              elevation: 0,
            ),
            primaryColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: DoctorDetailsView.routeName,
          onGenerateRoute: onGenerateRoute,
        );
      },
    );
  }
}
