import 'dart:convert';

List<CharacterModel> characterModelFromJson(String str) =>
    List<CharacterModel>.from(json.decode(str).map(CharacterModel.fromJson));

String characterModelToJson(List<CharacterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CharacterModel {
  CharacterModel({
    this.id,
    this.name,
    this.image,
    this.level,
    this.faction,
    this.attribute,
    this.character,
  });

  factory CharacterModel.decoderFromJson(dynamic json) =>
      CharacterModel.fromJson(json);

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        level: json['level'],
        faction: json['faction'],
        attribute: json['attribute'] == null
            ? null
            : Attribute.fromJson(json['attribute']),
        character: json['character'] == null
            ? null
            : Character.fromJson(json['character']),
      );

  final int? id;
  final String? name;
  final String? image;
  final int? level;
  final String? faction;
  final Attribute? attribute;
  final Character? character;

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

class Attribute {
  Attribute({
    this.punch,
    this.defense,
    this.sword,
    this.weapon,
    this.fruit,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        punch: json['punch'],
        defense: json['defense'],
        sword: json['sword'],
        weapon: json['weapon'],
        fruit: json['fruit'],
      );

  final int? punch;
  final int? defense;
  final int? sword;
  final int? weapon;
  final int? fruit;

  Map<String, dynamic> toJson() => {
        'punch': punch,
        'defense': defense,
        'sword': sword,
        'weapon': weapon,
        'fruit': fruit,
      };
}

class Character {
  Character({
    this.name,
    this.avatars,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: json['name'],
        avatars: json['avatars'] == null
            ? null
            : List<Avatar>.from(json['avatars'].map(Avatar.fromJson)),
      );

  final String? name;
  final List<Avatar>? avatars;

  Map<String, dynamic> toJson() => {
        'name': name,
        'avatars': avatars == null
            ? null
            : List<dynamic>.from(avatars!.map((x) => x.toJson())),
      };
}

class Avatar {
  Avatar({
    this.image,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        image: json['image'],
      );

  final String? image;

  Map<String, dynamic> toJson() => {
        'image': image,
      };
}
