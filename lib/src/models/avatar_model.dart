class AvatarModel {
  AvatarModel({
    this.image,
  });

  factory AvatarModel.fromJson(Map<String, dynamic> json) => AvatarModel(
        image: json['image'],
      );

  final String? image;

  Map<String, dynamic> toJson() => {
        'image': image,
      };
}
