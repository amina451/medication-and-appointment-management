import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/auth/presnetion/manger/sign_up/sing_up_cubit.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/custom_bloc_consumer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = 'sign_up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomBlocConsumer(),
      ),
    );
  }
}
