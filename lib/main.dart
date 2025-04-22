import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/helper_functions/material_route.dart';
import 'package:pharmacy_app/features/home/presention/view/home_view.dart';

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

        builder: (context,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: HomeView.routeName,
            onGenerateRoute: onGenerateRoute,
          );
        }
      
    );
  }
}
