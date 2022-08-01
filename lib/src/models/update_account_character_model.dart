import 'dart:convert';

UpdateAccountCharacterModel updateAccountCharacterModelFromJson(String str) =>
    UpdateAccountCharacterModel.fromJson(json.decode(str));

String updateAccountCharacterModelToJson(UpdateAccountCharacterModel data) =>
    json.encode(data.toJson());

class UpdateAccountCharacterModel {
  UpdateAccountCharacterModel({
    required this.biography,
  });

  factory UpdateAccountCharacterModel.fromJson(Map<String, dynamic> json) =>
      UpdateAccountCharacterModel(
        biography: json['biography'],
      );

  String biography;

  Map<String, dynamic> toJson() => {
        'biography': biography,
      };
}
