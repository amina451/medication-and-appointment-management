import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/helper_functions/material_route.dart';
import 'package:pharmacy_app/core/services/bloc_observer.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/constants.dart';
import 'package:pharmacy_app/core/utils/theme_data.dart';
import 'package:pharmacy_app/features/date/manger/date_cubit.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_cubit.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_cubit.dart';
import 'package:pharmacy_app/features/spalsh/presention/views/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   CustomBlocObserver();
   await Supabase.initialize(url: urlSubaBase, anonKey: apiKey);

  setup();
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => 
            getIt<DoctorsCubit>()..fetchDoctors(),),
            BlocProvider(create: (context) => 
            getIt<MedicationsCubit>()..fetchMedications(),
            ),
            BlocProvider(create: (context) => 
            getIt<DatesCubit>()..fetchDates(),
            ),
          
          ],
          child: MaterialApp(
            theme: themeData(),
            debugShowCheckedModeBanner: false,
            initialRoute: SplashView.routName,
            onGenerateRoute: onGenerateRoute,
          ),
        );
      },
    );
  }

  
}
