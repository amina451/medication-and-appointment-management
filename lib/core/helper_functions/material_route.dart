import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/auth/views/screens/login_view.dart';
import 'package:pharmacy_app/features/auth/views/screens/sign_up_view.dart';
import 'package:pharmacy_app/features/date/presentaions/views/date_view.dart';
import 'package:pharmacy_app/features/doctor_details/presention/view/doctor_detailes_view.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/Perescarptions_view.dart';
import 'package:pharmacy_app/features/doctors/presention/views/doctors_view.dart';
import 'package:pharmacy_app/features/home/presention/view/home_view.dart';
import 'package:pharmacy_app/features/home/presention/widgets/custom_nav_bar.dart';
import 'package:pharmacy_app/features/medications/presention/views/medications_views.dart';
import 'package:pharmacy_app/features/spalsh/presention/views/splash_view.dart';

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routName:
      return MaterialPageRoute(builder: (_) => SplashView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => SignUpView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => HomeView());

    case DoctorsView.routeName:
      return MaterialPageRoute(builder: (_) => DoctorsView());

    case MedicationsView.routeName:
      return MaterialPageRoute(builder: (_) => MedicationsView());

    case CustomBottomNavBar.routeName:
      return MaterialPageRoute(builder: (_) => CustomBottomNavBar());
    case PerescarptionsView.routeName:
      return MaterialPageRoute(builder: (_) => PerescarptionsView());
case DateView.routeName:
      return MaterialPageRoute(builder: (_) => DateView());

      case DoctorDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => DoctorDetailsView());
    default:
      return MaterialPageRoute(builder: (_) => Scaffold());
  }
}
