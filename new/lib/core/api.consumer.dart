abstract class ApiConsumer{
  Future<dynamic> get(
      String path , {
        Object ? data ,
        Map<String, dynamic> ? queryParamerters,
        bool isFormData=false,
      }
      );
  Future<dynamic> post(String path , {
    Object ? data ,
    Map<String, dynamic> ? queryParamerters,
    bool isFormData=false,
  });
  Future<dynamic>  Patch(String path , {
    Object ? data ,
    Map<String, dynamic> ? queryParamerters,
    bool isFormData=false,
  });
  Future<dynamic> delete(String path , {
    Object ? data ,
    Map<String, dynamic> ? queryParamerters,
    bool isFormData=false,
  });

}