import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/auth/views/screens/login_view.dart';
import 'package:pharmacy_app/features/auth/views/widgets/cusom_text_form_field.dart';
import 'package:pharmacy_app/features/auth/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/auth/views/widgets/term_use_privacy.dart';

class SectionFormData extends StatelessWidget {
  const SectionFormData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        FormTitle(title: "Full Name"),
        SizedBox(height: 5),
        CustomTextFormField(
          keyboardType: TextInputType.name,
          hint: "Full Name",
        ),

        SizedBox(height: 12),
        FormTitle(title: "Email"),
        SizedBox(height: 5),
        CustomTextFormField(
          keyboardType: TextInputType.name,
          hint: "example@gmail.com",
        ),

        SizedBox(height: 12),

        FormTitle(title: "Password"),
        SizedBox(height: 5),
        CustomTextFormField(
          icon: Icons.visibility_off,
          keyboardType: TextInputType.visiblePassword,
          hint: "***************",
        ),

        SizedBox(height: 12),
        FormTitle(title: "Mobile Number"),
        SizedBox(height: 5),
        CustomTextFormField(
          keyboardType: TextInputType.name,
          hint: "+20*********",
        ),

        SizedBox(height: 16),
        Align(alignment: Alignment.center, child: TermsUsePrivacy()),

        SizedBox(height: 16),

        Align(
          alignment: Alignment.center,
          child: CustomButton(
            title: "Sign Up",
            buttonTitleColor: Colors.white,
            buttonColor: AppColor.primaryColor,
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
          ),
        ),
        SizedBox(height: 4),
      ],
    );
  }
}
