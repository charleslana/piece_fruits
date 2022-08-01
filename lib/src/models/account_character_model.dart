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
    this.bounty,
    this.fame,
    this.power,
    this.biography,
    this.belly,
    this.gold,
    this.dayScore,
    this.immunity,
    this.experience,
    this.honorWin,
    this.totalBattle,
    this.win,
    this.defeat,
    this.draw,
    this.damageHit,
    this.damageTaken,
    this.bellyWon,
    this.bellyLost,
    this.score,
    this.attribute,
    this.character,
  });

  factory AccountCharacterModel.decoderFromJson(dynamic json) =>
      AccountCharacterModel.fromJson(json);

  factory AccountCharacterModel.fromJson(Map<String, dynamic> json) =>
      AccountCharacterModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        level: json['level'],
        faction: json['faction'],
        bounty: json['bounty'],
        fame: json['fame'],
        power: json['power'],
        biography: json['biography'],
        belly: json['belly'],
        gold: json['gold'],
        dayScore: json['dayScore'],
        immunity:
            json['immunity'] == null ? null : DateTime.parse(json['immunity']),
        experience: json['experience'],
        honorWin: json['honorWin'],
        totalBattle: json['totalBattle'],
        win: json['win'],
        defeat: json['defeat'],
        draw: json['draw'],
        damageHit: json['damageHit'],
        damageTaken: json['damageTaken'],
        bellyWon: json['bellyWon'],
        bellyLost: json['bellyLost'],
        score: json['score'],
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
  final int? bounty;
  final int? fame;
  final int? power;
  final String? biography;
  final int? belly;
  final int? gold;
  final int? dayScore;
  final DateTime? immunity;
  final int? experience;
  final int? honorWin;
  final int? totalBattle;
  final int? win;
  final int? defeat;
  final int? draw;
  final int? damageHit;
  final int? damageTaken;
  final int? bellyWon;
  final int? bellyLost;
  final int? score;
  final AttributeModel? attribute;
  final CharacterModel? character;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'level': level,
        'faction': faction,
        'bounty': bounty,
        'fame': fame,
        'power': power,
        'biography': biography,
        'belly': belly,
        'gold': gold,
        'dayScore': dayScore,
        'immunity': immunity!.toIso8601String(),
        'experience': experience,
        'honorWin': honorWin,
        'totalBattle': totalBattle,
        'win': win,
        'defeat': defeat,
        'draw': draw,
        'damageHit': damageHit,
        'damageTaken': damageTaken,
        'bellyWon': bellyWon,
        'bellyLost': bellyLost,
        'score': score,
        'attribute': attribute == null ? null : attribute!.toJson(),
        'character': character == null ? null : character!.toJson(),
      };
}
