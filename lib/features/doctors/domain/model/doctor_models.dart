import 'package:pharmacy_app/features/doctors/data/entitiy/doctor_entity.dart';

class DoctorModel {
  final String doctorId;
  final String doctorName;
  final String imageUrl;
  final String spicility;
  final String address;
  final String phone;
  final String userId;

  DoctorModel({
    required this.doctorId,
    required this.doctorName,
    required this.imageUrl,
    required this.spicility,
    required this.address,
    required this.phone,
    required this.userId,
  });

  factory DoctorModel.mapDoctorEntity(DoctorEntity doctor) {
    return DoctorModel(
      doctorId: doctor.doctorId,
      doctorName: doctor.doctorName,
      imageUrl: doctor.imageUrl,
      spicility: doctor.spicility,
      address: doctor.address,
      phone: doctor.phone,
      userId: doctor.userId,
    );
  }

  DoctorEntity toEntity() {
    return DoctorEntity(
      doctorId: doctorId,
      doctorName: doctorName,
      imageUrl: imageUrl,
      spicility: spicility,
      address: address,
      phone: phone,
      userId: userId,
    );
  }

  DoctorModel copyWith({
    String? doctorId,
    String? doctorName,
    String? imageUrl,
    String? spicility,
    String? address,
    String? phone,
    String? userId,
  }) {
    return DoctorModel(
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      imageUrl: imageUrl ?? this.imageUrl,
      spicility: spicility ?? this.spicility,
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
