import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/widgets/custom_app_bar.dart';
import 'package:pharmacy_app/features/auth/views/screens/login_view.dart';
import 'package:pharmacy_app/features/auth/views/widgets/don%60t_have_an_account.dart';
import 'package:pharmacy_app/features/auth/views/widgets/section_from_data.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomAppBar(title: "New Account")),
            SliverToBoxAdapter(child: SectionFormData()),
            SliverToBoxAdapter(
              child: HaveOrDontHAveAnAcount(
                onTap: () {
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
                firstTitle: "already have an account?",
                secondTitle: "Log In",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
