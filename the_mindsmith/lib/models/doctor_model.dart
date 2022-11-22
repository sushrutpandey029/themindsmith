import 'dart:convert';

class DoctorModel {
  String doctorId;
  String doctorName;
  String doctorImage;
  String doctorNumber;
  String doctorAddress;
  String doctorQualification;
  String doctorSpecialty;
  String doctorExperience;
  String doctorClinicLocation;
  String doctorClinicNumber;
  String doctorEmail;
  String doctorPassword;
  String doctorFee;
  String doctorStatus;
  String languageSpoken;
  String rating;
  String shortBio;
  DoctorModel({
    required this.doctorId,
    required this.doctorName,
    required this.doctorImage,
    required this.doctorNumber,
    required this.doctorAddress,
    required this.doctorQualification,
    required this.doctorSpecialty,
    required this.doctorExperience,
    required this.doctorClinicLocation,
    required this.doctorClinicNumber,
    required this.doctorEmail,
    required this.doctorPassword,
    required this.doctorFee,
    required this.doctorStatus,
    required this.languageSpoken,
    required this.rating,
    required this.shortBio,
  });

  Map<String, dynamic> toMap() {
    return {
      'doctor_name': doctorName,
      'doctor_image': doctorImage,
      'doctor_id': doctorId,
      'doctor_number': doctorNumber,
      'doctor_address': doctorAddress,
      'doctor_qualification': doctorQualification,
      'doctor_speciality': doctorSpecialty,
      'doctor_experience': doctorExperience,
      'doctor_clinic_location': doctorClinicLocation,
      'doctor_clinic_number': doctorClinicNumber,
      'doctor_email': doctorEmail,
      'doctor_password': doctorPassword,
      'doctor_fee': doctorFee,
      'doctor_status': doctorStatus,
      "languages_spoken": languageSpoken,
      "rating": rating,
      "short_bio": shortBio,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      doctorId: map['id'] ?? '',
      doctorName: map['doctor_name'] ?? '',
      doctorImage: map['doctor_image'] ?? '',
      doctorNumber: map['doctor_number'] ?? '',
      doctorAddress: map['doctor_address'] ?? '',
      doctorQualification: map['doctor_qualification'] ?? '',
      doctorSpecialty: map['doctor_speciality'] ?? '',
      doctorExperience: map['doctor_experience'] ?? '',
      doctorClinicLocation: map['doctor_clinic_location'] ?? '',
      doctorClinicNumber: map['doctor_clinic_number'] ?? '',
      doctorEmail: map['doctor_email'] ?? '',
      doctorPassword: map['doctor_password'] ?? '',
      doctorFee: map['doctor_fee'] ?? '',
      doctorStatus: map['doctor_status'] ?? '',
      languageSpoken: map["languages_spoken"] ?? '',
      shortBio: map["short_bio"] ?? '',
      rating: map["rating"] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String source) =>
      DoctorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DoctorModel(doctorId: $doctorId, doctorName: $doctorName, doctorImage: $doctorImage, doctorNumber: $doctorNumber, doctorAddress: $doctorAddress, doctorQualification: $doctorQualification, doctorSpecialty: $doctorSpecialty, doctorExperience: $doctorExperience, doctorClinicLocation: $doctorClinicLocation, doctorClinicNumber: $doctorClinicNumber, doctorEmail: $doctorEmail, doctorPassword: $doctorPassword, doctorFee: $doctorFee, doctorStatus: $doctorStatus)';
  }
}
