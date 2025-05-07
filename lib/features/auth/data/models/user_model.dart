import 'package:pharmacy_app/features/auth/domin/entites/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends UserEntity {
  UserModel({ required super.name, required super.email, required super.uId}) ;

  factory UserModel.fromSupabaseUser(User user) {
    final userMetadata = user.userMetadata ?? {};
    final name = userMetadata['name'] as String? ?? '';

    return UserModel(
      name: name,
      email: user.email ?? '',
      uId: user.id,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': uId,
      'name': name,
      'email': email,
    };
  }
}