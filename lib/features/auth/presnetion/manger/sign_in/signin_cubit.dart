import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(SigInLoading());
    try {
      await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(SignInFailure(message: e.message));
    } catch (e) {
      log(e.toString());
      emit(SignInFailure(message: 'An unexpected error occurred, please try again'));
    }
  }
}