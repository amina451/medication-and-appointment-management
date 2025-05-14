import 'package:pharmacy_app/features/date/data/entitiy/date_entity.dart';

class DateModel {
  final String idDate;
  final String time;
  final String doctorName;
  final String userId;
  final String note;
  final String followUp;
  final String date;
  final String specialty;
  final String address;

  DateModel( {
    required this.address,
    required this.idDate,
    required this.time,
    required this.doctorName,
    required this.userId,
    required this.note,
    required this.followUp,
    required this.date,
    required this.specialty,
  });

  factory DateModel.mapFromEntity(DateEntity entity) {
    return DateModel(
      address: entity.address,
      idDate: entity.idDate,
      time: entity.time,
      doctorName: entity.doctorName,
      userId: entity.userId,
      note: entity.note,
      followUp: entity.followUp,
      date: entity.date,
      specialty: entity.specialty,
    );
  }

  DateEntity toEntity() {
    return DateEntity(
      address: address,
      idDate: idDate,
      time: time,
      doctorName: doctorName,
      userId: userId,
      note: note,
      followUp: followUp,
      date: date,
      specialty: specialty,
    );
  }

  DateModel copyWith({
    String ?address,
    String? idDateCopy,
    DateTime? createdAt,
    String? time,
    String? doctorName,
    String? userId,
    String? note,
    String? followUp,
    String? date,
    String? specialty,
  }) {
    return DateModel(
      address: address??this.address,
      idDate: idDateCopy ?? this.idDate,
      time: time ?? this.time,
      doctorName: doctorName ?? this.doctorName,
      userId: userId ?? this.userId,
      note: note ?? this.note,
      followUp: followUp ?? this.followUp,
      date: date ?? this.date,
      specialty: specialty ?? this.specialty,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateModel &&
          runtimeType == other.runtimeType &&
          idDate == other.idDate;

  @override
  int get hashCode => idDate.hashCode;
}
