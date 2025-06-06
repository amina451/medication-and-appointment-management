import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
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
      emit(SignInFailure(message: e.message)); // Vous pouvez traduire ici
    } catch (e) {
      log(e.toString());
      emit(SignInFailure(message: 'Une erreur inattendue est survenue, veuillez réessayer'));
    }
  }
}
