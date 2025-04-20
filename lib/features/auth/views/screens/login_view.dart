import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/auth/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: LoginViewBody());
  }
}
