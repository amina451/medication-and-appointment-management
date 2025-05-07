import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:pharmacy_app/features/auth/presnetion/manger/sign_up/sign_up_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupCubit() : super(SignUpInitial());



SupabaseClient client = Supabase.instance.client;
  Future<void> signUp({required String name,required String phone,    required String email, required String password}) async {
    emit(SignUpLoading());
    try {
      await client.auth.signUp(password: password, email: email);
      emit(SignUpSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(SignUpFailure(message: e.message));
    } catch (e) {
            log(e.toString());

      emit(SignUpFailure(message: e.toString()));
    }
  }
}