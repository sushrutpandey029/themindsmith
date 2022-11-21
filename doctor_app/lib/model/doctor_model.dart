class DoctorModel {
  DoctorModel({
    required this.doctorId,
    required this.doctorName,
    required this.doctorImage,
    required this.doctorNumber,
    required this.doctorAddress,
    required this.doctorQualification,
    required this.doctorSpeciality,
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

  String doctorId;
  String doctorName;
  String doctorImage;
  String doctorNumber;
  String doctorAddress;
  String doctorQualification;
  String doctorSpeciality;
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

  factory DoctorModel.fromMap(Map<String, dynamic> json) => DoctorModel(
        doctorId: json["id"],
        doctorName: json["doctor_name"],
        doctorImage: json["doctor_image"],
        doctorNumber: json["doctor_number"],
        doctorAddress: json["doctor_address"],
        doctorQualification: json["doctor_qualification"],
        doctorSpeciality: json["doctor_speciality"],
        doctorExperience: json["doctor_experience"],
        doctorClinicLocation: json["doctor_clinic_location"],
        doctorClinicNumber: json["doctor_clinic_number"],
        doctorEmail: json["doctor_email"],
        doctorPassword: json["doctor_password"],
        doctorFee: json["doctor_fee"],
        doctorStatus: json["doctor_status"],
        languageSpoken: json["languages_spoken"],
        shortBio: json["short_bio"],
        rating: json["rating"],
      );

  Map<String, dynamic> toMap() => {
        "id": doctorId,
        "doctor_name": doctorName,
        "doctor_image": doctorImage,
        "doctor_number": doctorNumber,
        "doctor_address": doctorAddress,
        "doctor_qualification": doctorQualification,
        "doctor_speciality": doctorSpeciality,
        "doctor_experience": doctorExperience,
        "doctor_clinic_location": doctorClinicLocation,
        "doctor_clinic_number": doctorClinicNumber,
        "doctor_email": doctorEmail,
        "doctor_password": doctorPassword,
        "doctor_fee": doctorFee,
        "doctor_status": doctorStatus,
        "languages_spoken": languageSpoken,
        "rating": rating,
        "short_bio": shortBio,
      };

  @override
  String toString() {
    return 'DoctorModel(doctorId: $doctorId, doctorName: $doctorName, doctorImage: $doctorImage, doctorNumber: $doctorNumber, doctorAddress: $doctorAddress, doctorQualification: $doctorQualification, doctorSpeciality: $doctorSpeciality, doctorExperience: $doctorExperience, doctorClinicLocation: $doctorClinicLocation, doctorClinicNumber: $doctorClinicNumber, doctorEmail: $doctorEmail, doctorPassword: $doctorPassword, doctorFee: $doctorFee, doctorStatus: $doctorStatus)';
  }
}
