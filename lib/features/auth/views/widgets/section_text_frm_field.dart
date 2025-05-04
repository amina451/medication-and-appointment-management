import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/auth/views/widgets/cusom_text_form_field.dart';
import 'package:pharmacy_app/features/auth/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/home/presention/view/home_view.dart';

class SectionTextFormField extends StatelessWidget {
  const SectionTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormTitle(title: "Mobile Number"),
        SizedBox(height: 12.h),
        CustomTextFormField(
          keyboardType: TextInputType.emailAddress,
          hint: "example@example.com",
        ),
        SizedBox(height: 20.h),
        FormTitle(title: "Password"),
        SizedBox(height: 12),
        CustomTextFormField(
          icon: Icons.visibility_off,
          keyboardType: TextInputType.visiblePassword,
          hint: "***************",
        ),
        SizedBox(height: 25.h),
        Align(
          alignment: Alignment.center,
          child: CustomButton(
            title: 'Log In',
            buttonTitleColor: Colors.white,
            buttonColor: AppColor.primaryColor,
            onPressed: () {
              Navigator.pushReplacementNamed(context, HomeView.routeName);
            },
          ),
        ),
      ],
    );
  }
}
