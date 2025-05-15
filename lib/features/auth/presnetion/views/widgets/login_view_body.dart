import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/widgets/custom_app_bar.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/screens/sign_up_view.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/don%60t_have_an_account.dart';

import 'package:pharmacy_app/features/auth/presnetion/views/widgets/section_text_frm_field.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/welcome_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomAppBar(title: "Connexion")),
            SliverToBoxAdapter(child: WelcomeSection()),
            SliverToBoxAdapter(child: SectionTextFormField()),
            SliverToBoxAdapter(
              child: HaveOrDontHAveAnAcount(
                onTap: () {
                  Navigator.pushReplacementNamed(context, SignUpView.routeName);
                },
                firstTitle: 'Vous n\'avez pas de compte ?',
                secondTitle: "S'inscrire",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
