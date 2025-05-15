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
        data: {
          'name': name.trim(),
          'phone': phone.trim(),
          "medicationList":[],
          "doctorList":[],
        },
      );
      if (response.user == null) {
        emit(SignUpFailure(message: 'Échec de l\'inscription, utilisateur non trouvé'));
      } else {
        await addDataUser(email: email, name: name, phone: phone);
        emit(SignUpSuccess());
      }
    } on AuthException catch (e) {
      devtools.log('AuthException: ${e.toString()}');
      switch (e.message) {
        case 'missing email or phone':
          emit(
            SignUpFailure(message: 'Veuillez fournir un e-mail ou un numéro de téléphone'),
          );
          break;
        case 'Invalid signup credentials':
          emit(
            SignUpFailure(
              message: 'Identifiants d\'inscription invalides, vérifiez votre mot de passe',
            ),
          );
          break;
        case 'Email not confirmed':
          emit(SignUpFailure(message: 'Veuillez confirmer votre e-mail'));
          break;
        default:
          emit(
            SignUpFailure(
              message: 'Une erreur est survenue lors de l\'inscription, veuillez réessayer',
            ),
          );
      }
    } catch (e) {
      devtools.log('Unexpected error: ${e.toString()}');
      emit(
        SignUpFailure(
          message:
              'Une erreur inattendue est survenue, vérifiez votre connexion internet',
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
        emit(SignUpFailure(message: 'Aucun utilisateur n\'est actuellement connecté'));
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
      devtools.log('Erreur base de données: ${e.toString()}');
      emit(
        SignUpFailure(message: 'Échec de l\'enregistrement de vos données, veuillez réessayer'),
      );
    } catch (e) {
      devtools.log('Erreur inattendue dans addDataUser: ${e.toString()}');
      emit(SignUpFailure(message: 'Une erreur est survenue lors de l\'enregistrement des données'));
    }
  }
}
