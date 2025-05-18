class DoctorEntity {
  final String doctorId;
  final String doctorName;
  final String imageUrl;
  final String spicility;
  final String address;
  final String phone;
  final String userId;

  DoctorEntity({
    required this.doctorId,
    required this.doctorName,
    required this.imageUrl,
    required this.spicility,
    required this.address,
    required this.phone,
    required this.userId,
 
  });

  factory DoctorEntity.fromJson(Map<String, dynamic> json) {
    return DoctorEntity(
      doctorId: json['doctor_id'] as String,
      doctorName: json['name_doctor'] as String,
      imageUrl: json['image_url'] as String,
      spicility: json['spicility'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      userId: json['id_user'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name_doctor': doctorName,
      'image_url': imageUrl,
      'spicility': spicility,
      'address': address,
      'phone': phone,
      'id_user': userId,
    };
  }
}
