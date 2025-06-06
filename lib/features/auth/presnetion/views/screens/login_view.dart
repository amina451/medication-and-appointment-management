import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pharmacy_app/core/helper_functions/build_show_toast.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/auth/presnetion/manger/sign_in/signin_cubit.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/login_view_body.dart';
import 'package:pharmacy_app/features/home/presention/view/widgets/custom_nav_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'Connexion';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              buildShowToast(
                message: "Connexion réussie",
                color: AppColor.primaryColor,
              );
              Navigator.pushReplacementNamed(
                context,
                CustomBottomNavBar.routeName,
              );
            } else if (state is SignInFailure) {
              buildShowToast(
                message: "Problème avec l'e-mail ou le mot de passe",
                color: Colors.red.shade500,
              );
            }
          },

          builder: (context, state) {
            return ModalProgressHUD(
              progressIndicator: Center(
                child: CircularProgressIndicator(color: AppColor.primaryColor),
              ),
              color: AppColor.primaryColor,
              inAsyncCall: state is SigInLoading ? true : false,
              child: LoginViewBody(),
            );
          },
        ),
      ),
    );
  }
}
