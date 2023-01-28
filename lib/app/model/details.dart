class Details {
  String? title;
  String? cropTitle;
  List<GalleryDisease>? galleryDisease;
  String? description;
  String? createdAt;

  Details(
      {this.title,
      this.cropTitle,
      this.galleryDisease,
      this.description,
      this.createdAt});

  Details.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cropTitle = json['crop__title'];
    if (json['gallery_disease'] != null) {
      galleryDisease = <GalleryDisease>[];
      json['gallery_disease'].forEach((v) {
        galleryDisease!.add(GalleryDisease.fromJson(v));
      });
    }
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['crop__title'] = cropTitle;
    if (galleryDisease != null) {
      data['gallery_disease'] = galleryDisease!.map((v) => v.toJson()).toList();
    }
    data['description'] = description;
    data['created_at'] = createdAt;
    return data;
  }
}

class GalleryDisease {
  String? imageUrl;

  GalleryDisease({this.imageUrl});

  GalleryDisease.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    return data;
  }
}
