class EndPoints {
  static String baseUrl = 'https://food-api-omega.vercel.app/api/v1/user/' ;
  static String signIn = 'signin' ;
  static String signUp = 'signup' ;
  static String getUserData (id){ return 'get-user/$id';} 
  static String delete (id){ return 'delete?$id'; }
}


class APIKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "_id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
}