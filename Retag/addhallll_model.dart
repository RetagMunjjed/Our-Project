class AddhallllModel {
  final String nameAr;
  final String nameEn;
  final String locationAr;
  final String locationEn;
  final int capacity;
  final String price;

  final ImageURlModell image_url;

  AddhallllModel({
    required this.nameAr,
    required this.nameEn,
    required this.locationAr,
    required this.locationEn,
    required this.capacity,
    required this.price,
    required this.image_url,
  });

  factory AddhallllModel.fromJson(Map<String, dynamic> json) {
    return AddhallllModel(
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      locationAr: json['location_ar'],
      locationEn: json['location_en'],
      capacity: json['capacity'],
      price: json['price'],
      image_url: ImageURlModell.fromJson(json['image_url']),
    );
  }
}

class ImageURlModell {
  final String image_1;
  final String image_2;
  final String image_3;
  final String image_4;
  final String image_5;
  final String image_6;

  ImageURlModell(
      {required this.image_1,
      required this.image_2,
      required this.image_3,
      required this.image_4,
      required this.image_5,
      required this.image_6});

  factory ImageURlModell.fromJson(Map<String, dynamic> json) {
    return ImageURlModell(
      image_1: json['image_1'] ?? "",
      image_2: json['image_2'] ?? "",
      image_3: json['image_3'] ?? "",
      image_4: json['image_4'] ?? "",
      image_5: json['image_5'] ?? "",
      image_6: json['image_6'] ?? "",
    );
  }
}
