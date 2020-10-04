import 'dart:convert';

class UserModel {
  String username;
  UserModel({
    this.username,
  });

  UserModel copyWith({
    String username,
  }) {
    return UserModel(
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(username: $username)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel && o.username == username;
  }

  @override
  int get hashCode => username.hashCode;
}
