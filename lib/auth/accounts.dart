class UserModel {
  String name;
  String email;
  String password;
  UserModel({required this.name, required this.email, required this.password});
}

class AuthManager {
  static List<UserModel> registerUsers = [];
}



class SaveRecord {
  static String? name;
  static String? email;
  static String? photo;
}
