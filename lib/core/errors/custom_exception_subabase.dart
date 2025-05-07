  import 'package:pharmacy_app/core/errors/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

CustomException handleAuthError(AuthException error) {
    switch (error.message.toLowerCase()) {
      case 'email already exists':
        return CustomException(
          message: 'This email is already registered. Please sign in.',
        );
      case 'invalid email address':
        return CustomException(
          message: 'Invalid email address. Please enter a valid email.',
        );
      case 'password should be at least 6 characters':
        return CustomException(
          message: 'Password must be at least 6 characters long.',
        );
      case 'network error':
        return CustomException(
          message: 'Please check your internet connection and try again.',
        );
      case 'too many requests':
        return CustomException(
          message: 'Too many requests. Please try again later.',
        );
      default:
        return CustomException(
          message: 'An unknown error occurred. Please try again later.',
        );
    }
  }