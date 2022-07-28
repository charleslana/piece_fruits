import 'dart:convert';

CreateAccountCharacterModel createAccountCharacterModelFromJson(String str) =>
    CreateAccountCharacterModel.fromJson(json.decode(str));

String createAccountCharacterModelToJson(CreateAccountCharacterModel data) =>
    json.encode(data.toJson());

class CreateAccountCharacterModel {
  CreateAccountCharacterModel({
    required this.name,
    required this.characterId,
    required this.faction,
  });

  factory CreateAccountCharacterModel.fromJson(Map<String, dynamic> json) =>
      CreateAccountCharacterModel(
        name: json['name'],
        characterId: json['characterId'],
        faction: json['faction'],
      );

  String name;
  int characterId;
  String faction;

  Map<String, dynamic> toJson() => {
        'name': name,
        'characterId': characterId,
        'faction': faction,
      };
}
