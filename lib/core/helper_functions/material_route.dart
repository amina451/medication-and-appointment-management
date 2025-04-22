import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/auth/views/screens/login_view.dart';
import 'package:pharmacy_app/features/auth/views/screens/sing_up_view.dart';
import 'package:pharmacy_app/features/home/presention/view/home_view.dart';
import 'package:pharmacy_app/features/spalsh/views/splash_view.dart';

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
   
    default:
      return MaterialPageRoute(builder: (_) => Scaffold());
  }
}
