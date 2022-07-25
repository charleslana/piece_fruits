// ignore_for_file: unnecessary_lambdas

import 'package:piece_fruits/src/models/avatar_model.dart';

class CharacterModel {
  CharacterModel({
    this.id,
    this.name,
    this.avatars,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'],
        name: json['name'],
        avatars: json['avatars'] == null
            ? null
            : List<AvatarModel>.from(
                json['avatars'].map((dynamic x) => AvatarModel.fromJson(x))),
      );

  static List<CharacterModel> listFromJson(dynamic list) =>
      List<CharacterModel>.from(
          list.map((dynamic x) => CharacterModel.fromJson(x)));

  final int? id;
  final String? name;
  final List<AvatarModel>? avatars;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatars': avatars == null
            ? null
            : List<dynamic>.from(avatars!.map((x) => x.toJson())),
      };
}
