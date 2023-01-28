class Disease {
  String? title;
  String? cropTitle;
  String? imageUrl;
  String? createdAt;

  Disease({this.title, this.cropTitle, this.imageUrl, this.createdAt});

  Disease.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cropTitle = json['crop__title'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['crop__title'] = cropTitle;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    return data;
  }
}
