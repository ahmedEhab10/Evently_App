class UserModel {
  static UserModel? currentUser;
  String id;
  String name;
  String email;
  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], name: json['name'], email: json['email']);
  }

  Map<String, dynamic> tojason() => {'id': id, 'name': name, 'email': email};
}
