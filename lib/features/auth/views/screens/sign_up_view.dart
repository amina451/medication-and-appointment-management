import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/auth/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = 'sign_up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: SignUpViewBody());
  }
}
