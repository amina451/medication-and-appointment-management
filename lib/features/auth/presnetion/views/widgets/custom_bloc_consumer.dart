import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/auth/presnetion/manger/sign_up/sign_up_state.dart';
import 'package:pharmacy_app/features/auth/presnetion/manger/sign_up/sing_up_cubit.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/screens/login_view.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/sign_up_view_body.dart';


class CustomBlocConsumer extends StatelessWidget {
  const CustomBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Confirm Email')),
          );
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return  ModalProgressHUD(
          progressIndicator: Center(
          child: CircularProgressIndicator(color: AppColor.primaryColor,)),
          color: AppColor.primaryColor,
          inAsyncCall: state is SignUpLoading ? true :false,
          child: SignUpViewBody());
      },
    );
  }
}




