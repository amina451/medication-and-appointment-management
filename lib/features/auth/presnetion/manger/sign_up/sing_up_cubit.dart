import 'dart:developer' as devtools show log;
import 'package:bloc/bloc.dart';
import 'package:pharmacy_app/features/auth/presnetion/manger/sign_up/sign_up_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupCubit() : super(SignUpInitial());

  final SupabaseClient client = Supabase.instance.client;

  Future<void> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      final response = await client.auth.signUp(
        email: email.trim(),
        password: password.trim(),
        data: {'name': name.trim(), 'phone': phone.trim()},
      );
      if (response.user == null) {
        emit(SignUpFailure(message: 'Sign-up failed, user not found'));
      } else {
        await addDataUser(email: email, name: name, phone: phone);
        emit(SignUpSuccess());
      }
    } on AuthException catch (e) {
      devtools.log('AuthException: ${e.toString()}');
      switch (e.message) {
        case 'missing email or phone':
          emit(
            SignUpFailure(message: 'Please provide an email or phone number'),
          );
          break;
        case 'Invalid signup credentials':
          emit(
            SignUpFailure(
              message: 'Invalid sign-up credentials, check your password',
            ),
          );
          break;
        case 'Email not confirmed':
          emit(SignUpFailure(message: 'Please confirm your email'));
          break;
        default:
          emit(
            SignUpFailure(
              message: 'An error occurred during sign-up, please try again',
            ),
          );
      }
    } catch (e) {
      devtools.log('Unexpected error: ${e.toString()}');
      emit(
        SignUpFailure(
          message:
              'An unexpected error occurred, check your internet connection',
        ),
      );
    }
  }

  Future<void> addDataUser({
    required String email,
    required String name,
    required String phone,
  }) async {
    try {
      if (client.auth.currentUser == null) {
        emit(SignUpFailure(message: 'No user is currently signed in'));
        return;
      }
      await client.from('users').upsert([
        {
          'user_id': client.auth.currentUser!.id,
          'name': name.trim(),
          'email': email.trim(),
          'phone': phone.trim(),
        },
      ]).select();
    } on PostgrestException catch (e) {
      devtools.log('Database error: ${e.toString()}');
      emit(
        SignUpFailure(message: 'Failed to save your data, please try again'),
      );
    } catch (e) {
      devtools.log('Unexpected error in addDataUser: ${e.toString()}');
      emit(SignUpFailure(message: 'An error occurred while saving the data'));
    }
  }
}
