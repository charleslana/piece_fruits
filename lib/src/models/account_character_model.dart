// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

import 'package:piece_fruits/src/models/attribute_model.dart';
import 'package:piece_fruits/src/models/character_model.dart';

List<AccountCharacterModel> accountCharacterModelFromJson(String str) =>
    List<AccountCharacterModel>.from(
        json.decode(str).map(AccountCharacterModel.fromJson));

String accountCharacterModelToJson(List<AccountCharacterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AccountCharacterModel {
  AccountCharacterModel({
    this.id,
    this.name,
    this.image,
    this.level,
    this.faction,
    this.attribute,
    this.character,
  });

  factory AccountCharacterModel.fromJson(Map<String, dynamic> json) =>
      AccountCharacterModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        level: json['level'],
        faction: json['faction'],
        attribute: json['attribute'] == null
            ? null
            : AttributeModel.fromJson(json['attribute']),
        character: json['character'] == null
            ? null
            : CharacterModel.fromJson(json['character']),
      );

  static List<AccountCharacterModel> listFromJson(dynamic list) =>
      List<AccountCharacterModel>.from(
          list.map((dynamic x) => AccountCharacterModel.fromJson(x)));

  final int? id;
  final String? name;
  final String? image;
  final int? level;
  final String? faction;
  final AttributeModel? attribute;
  final CharacterModel? character;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'level': level,
        'faction': faction,
        'attribute': attribute == null ? null : attribute!.toJson(),
        'character': character == null ? null : character!.toJson(),
      };
}
