class UserModel {
  static UserModel? currentUser;
  String id;
  String name;
  String email;
  List<String> FavoritesEventsid;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.FavoritesEventsid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      FavoritesEventsid: (json['FavoritesEventsid'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
    );
  }

  Map<String, dynamic> tojason() => {
    'id': id,
    'name': name,
    'email': email,
    'FavoritesEventsid': FavoritesEventsid,
  };
}
