import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_formpassword.dart';
import 'package:pharmacy_app/features/auth/presnetion/manger/sign_in/signin_cubit.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/cusom_text_form_field.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';

class SectionTextFormField extends StatefulWidget {
  const SectionTextFormField({super.key});

  @override
  State<SectionTextFormField> createState() => _SectionTextFormFieldState();
}

class _SectionTextFormFieldState extends State<SectionTextFormField> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (formKey.currentState!.validate()) {
      context.read<SignInCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FormTitle(title: "Email"),
          SizedBox(height: 12.h),
          CustomTextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hint: "example@example.com",
          ),
          SizedBox(height: 20.h),
          FormTitle(title: "Password"),
          SizedBox(height: 12),
          CustomFiledPassword(controller: _passwordController),
          SizedBox(height: 25.h),
          Align(
            alignment: Alignment.center,
            child: CustomButton(
              title: 'Log In',
              buttonTitleColor: Colors.white,
              buttonColor: AppColor.primaryColor,
              onPressed: _handleSignIn,
            ),
          ),
        ],
      ),
    );
  }
}