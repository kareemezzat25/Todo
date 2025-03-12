class UserModel {
  String? id;
  String? userName;
  String? email;
  int? createdAt;

  UserModel(
      {required this.id,
      required this.userName,
      required this.email,
      required this.createdAt});

  static fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        userName: json['userName'],
        email: json['email'],
        createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userName": userName,
      "email": email,
      "createdAt": createdAt
    };
  }
}
