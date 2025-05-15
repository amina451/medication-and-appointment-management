  import 'package:pharmacy_app/core/errors/exception.dart';
  import 'package:supabase_flutter/supabase_flutter.dart';

  CustomException handleAuthError(AuthException error) {
    switch (error.message.toLowerCase()) {
      case 'email already exists':
        return CustomException(
          message: 'Cet e-mail est déjà enregistré. Veuillez vous connecter.',
        );
      case 'invalid email address':
        return CustomException(
          message: 'Adresse e-mail invalide. Veuillez saisir une adresse valide.',
        );
      case 'password should be at least 6 characters':
        return CustomException(
          message: 'Le mot de passe doit contenir au moins 6 caractères.',
        );
      case 'network error':
        return CustomException(
          message: 'Veuillez vérifier votre connexion Internet et réessayer.',
        );
      case 'too many requests':
        return CustomException(
          message: 'Trop de requêtes. Veuillez réessayer plus tard.',
        );
      default:
        return CustomException(
          message: 'Une erreur inconnue est survenue. Veuillez réessayer plus tard.',
        );
    }
  }