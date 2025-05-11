import 'dart:io';

import 'package:pharmacy_app/features/doctors/data/entitiy/doctor_entity.dart';

class DoctorModel {
  final String doctorId;
  final String doctorName;
  final String image;
  final String specialty;
  final String address;
  final String phone;
  final String userId;

  DoctorModel({
    required this.doctorId,
    required this.doctorName,
    required this.image,
    required this.specialty,
    required this.address,
    required this.phone,
    required this.userId,
  });

  factory DoctorModel.mapDoctorEntity(DoctorEntity doctor) {
    return DoctorModel(
      doctorId: doctor.doctorId,
      doctorName: doctor.doctorName,
      image: doctor.image,
      specialty: doctor.specialty,
      address: doctor.address,
      phone: doctor.phone,
      userId: doctor.userId,
    );
  }

  DoctorEntity toEntity() {
    return DoctorEntity(
      doctorId: doctorId,
      doctorName: doctorName,
      image: image,
      specialty: specialty,
      address: address,
      phone: phone,
      userId: userId,
    );
  }

  DoctorModel copyWith({
    String? doctorId,
    String? doctorName,
    String? imageUrl,
    String? specialty,
    String? address,
    String? phone,
    String? userId,
  }) {
    return DoctorModel(
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      image: imageUrl ?? image,
      specialty: specialty ?? this.specialty,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      userId: userId ?? this.userId,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorModel &&
          runtimeType == other.runtimeType &&
          doctorId == other.doctorId;

  @override
  int get hashCode => doctorId.hashCode;
}
