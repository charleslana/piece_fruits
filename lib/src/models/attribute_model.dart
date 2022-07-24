class AttributeModel {
  AttributeModel({
    this.punch,
    this.defense,
    this.sword,
    this.weapon,
    this.fruit,
  });

  factory AttributeModel.fromJson(Map<String, dynamic> json) => AttributeModel(
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
