class EndPoints {
static String baseUrl="http://192.168.1.103:8000/api/";
static String singhin = "users/register";
static String login = "users/login";
static String logout = "users/logout";
static String get_all_events = "event-types";
static const String imageUrl = 'http://192.168.1.103:8000';
static String search_events = "search/Events";
static String search_history='event-types';

static String getHallsDataEndPoint(int id) {
  return 'event-types/2/halls';
}

}

class ApiKey{

  static String status="status";
  static String errormessage= "message";

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
}