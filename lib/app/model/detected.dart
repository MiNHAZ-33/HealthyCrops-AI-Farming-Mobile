class Detected {
  String? disease;

  Detected({this.disease});

  Detected.fromJson(Map<String, dynamic> json) {
    disease = json['disease'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disease'] = disease;
    return data;
  }
}
