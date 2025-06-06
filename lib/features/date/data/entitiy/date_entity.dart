class DateEntity {
  final String idDate;
  final String time;
  final String doctorName;
  final String userId;
  final String note;
  final String followUp;
  final String date;
  final String specialty;
  final String address;

  DateEntity({
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

  factory DateEntity.fromJson(Map<String, dynamic> json) {
    return DateEntity(
      address: json['address'] as String,
      idDate: json['id_date'] as String,
      time: json['time'] as String,
      doctorName: json['doctor_name'] as String,
      userId: json['user_id'] as String,
      note: json['note'] as String,
      followUp: json['follow_up'] as String,
      date: json['date'] as String,
      specialty: json['spicialty'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "address":address,
      'id_date': idDate,
      'time': time,
      'doctor_name': doctorName,
      'user_id': userId,
      'note': note,
      'follow_up': followUp,
      'date': date,
      'spicialty': specialty,
    };
  }
}
