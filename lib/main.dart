import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/helper_functions/material_route.dart';
import 'package:pharmacy_app/features/date/presentaions/views/date_view.dart';

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
          initialRoute: DateView.routeName,
          onGenerateRoute: onGenerateRoute,
        );
      },
    );
  }
}
