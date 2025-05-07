import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/helper_functions/validation.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_formpassword.dart';
import 'package:pharmacy_app/features/auth/presnetion/manger/sign_up/sing_up_cubit.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/cusom_text_form_field.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/term_use_privacy.dart';

// ignore: must_be_immutable
class SectionFormData extends StatefulWidget {
  const SectionFormData({super.key});

  @override
  State<SectionFormData> createState() => _SectionFormDataState();
}

class _SectionFormDataState extends State<SectionFormData> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (formKey.currentState!.validate()) {
      context.read<SignupCubit>().signUp(
        name:_nameController.text,
        phone: _phoneController.text.trim(),
        email:   _emailController.text.trim(),
       password:   _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          FormTitle(title: "Full Name"),
          SizedBox(height: 5),
          CustomTextFormField(
            controller: _nameController,
            validator: Valid.validateName,
            keyboardType: TextInputType.name,
            hint: "Full Name",
          ),

          SizedBox(height: 12),
          FormTitle(title: "Email"),
          SizedBox(height: 5),
          CustomTextFormField(
            validator: Valid.validateEmail,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hint: "example@gmail.com",
          ),

          SizedBox(height: 12),

          FormTitle(title: "Password"),
          SizedBox(height: 5),
                    CustomFiledPassword(controller: _passwordController,),

          SizedBox(height: 12),
          FormTitle(title: "Mobile Number"),
          SizedBox(height: 5),
          CustomTextFormField(
            validator: Valid.validatePhone,
            controller: _phoneController,
            keyboardType: TextInputType.name,
            hint: "+213*********",
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
              onPressed: _handleSignUp,
            ),
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
