class EndPoint {
  static String baseUrl = "http://192.168.1.103:8000/api/";
  // static String signIn = "auth/login";
  // static String signUp = "auth/register";
  // static String getUserDataEndPoint(id) {
  //   return 'auth/user-profile/$id';
  // }

  static String getHallsDataEndPoint(id) {
    return 'event-types/2/halls';
  }

  static String getMusicDataEndPoint(id) {
    return "services/3/music";
  }

  static String getPhotoDataEndPoint(id) {
    return "services/3/photographers";
  }

  static String postTaskToCoordinator(id) {
    return "hall-owner/coordinators/assign/10";
  }
}

class ApiKey {
  //كرمال الكيوبيت شو حط فيه حسب كل واجهة متل login بدها email &password
  static String status = "status";
  static String message = "message";
  static String email = "email";
  static String location = "location";
  static String phone = "phone";
  static String profilePic = "profilePic";
  static String password = "password";
  static String password_confirmation = "password_confirmation";
  static String token = "token";
  // static String message = "message";
  //هي كرمال واجهة انواع الصالات
  static String id = "id";
  static String name = "name";
  static String nameA = "name_ar";
  static String nameE = "name_en";
  static String eventType = "event_type_id";
  static String locationA = "location_ar";
  static String locationE = "location_en";
  static String capacity = "capacity";
  static String price = "price";
  static String imageUrl = "image_url";
  //واجهة الموسيقى
  static String title = "title";
  static String artist = "artist";
  static String language = "language";
  static String created_at = "created_at";
  static String updated_at = "updated_at";
  static String assignment_id = "assignment_id";
  static String service = "service";
  static String coordinator = "coordinator";
  static String statuss = "status";
}
