import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.email,
    required this.password,
    required this.gender,
    required this.birthDate,
  });

  factory RegisterModel.decoderFromJson(dynamic json) =>
      RegisterModel.fromJson(json);

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        email: json['email'],
        password: json['password'],
        gender: json['gender'],
        birthDate: DateTime.parse(json['birthDate']),
      );

  final String email;
  final String password;
  final String gender;
  final DateTime birthDate;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'gender': gender,
        'birthDate':
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
      };
}
