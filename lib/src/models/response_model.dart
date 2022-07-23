import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    this.status,
    this.message,
    this.value,
  });

  factory ResponseModel.decoderFromJson(dynamic json) =>
      ResponseModel.fromJson(json);

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json['status'],
        message: json['message'],
        value: json['value'],
      );

  final String? status;
  final String? message;
  final String? value;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'value': value,
      };
}
