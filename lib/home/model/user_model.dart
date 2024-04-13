class UserModel{
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar
  });
  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      id: json["id"]??0,
       email: json["email"]??0, 
       firstName: json["firstName"]??0, 
       lastName: json['lastName']??0, 
       avatar: json["avatar"]??0,
      );
  }
}