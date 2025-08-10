import 'package:events/core/api/end_points.dart';

class ErroeModel {
  // final int status;
  final String message;
  ErroeModel(
      {
      //required this.status,
      required this.message});
  factory ErroeModel.fromJson(Map<String, dynamic> jsonData) {
    return ErroeModel(
        //هون اذا عملت send بالبوست مان وكان في خطأ  بحط كيف عرضلي الخطا ك رسالو ورقم الحالة او حسب شو بيكون خرج الخطأ عالبوست مان
        // status: jsonData[ApiKey.status],
        message: jsonData[ApiKey.message]);
  }
}
