import 'package:events/core/api/end_points.dart';

class HallsModel {
  final String nameEn;
  final String locationEn;
  final int capacity;
  final String price;
  final String? imageUrl;

  HallsModel({
    required this.nameEn,
    required this.locationEn,
    required this.capacity,
    required this.price,
    required this.imageUrl,
  });

  factory HallsModel.fromJson(Map<String, dynamic> jsonData) {
    return HallsModel(
      nameEn: jsonData[ApiKey.nameE],
      locationEn: jsonData[ApiKey.locationE],
      capacity: jsonData[ApiKey.capacity],
      price: jsonData[ApiKey.price],
      imageUrl: jsonData[ApiKey.imageUrl],
    );
  }

  /// لتحويل قائمة من البيانات
  static List<HallsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HallsModel.fromJson(json)).toList();
  }
}
