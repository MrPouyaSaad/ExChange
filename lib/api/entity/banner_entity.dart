class BannerEntity {
  final String imgUrl;

  BannerEntity({
    required this.imgUrl,
  });

  factory BannerEntity.fromJson(Map<String, dynamic> json) {
    return BannerEntity(
      imgUrl: json['img_src'] as String,
    );
  }
}
