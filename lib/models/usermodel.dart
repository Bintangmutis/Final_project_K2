class UserModel {
  final UserData userData;

  UserModel({required this.userData});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userData: UserData.fromJson(
          json['data'],
        ),
      );
}

class UserData {
  final UserDetail userDetail;

  UserData({required this.userDetail});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userDetail: UserDetail.fromJson(
          json['user'],
        ),
      );
}

class UserDetail {
  final int id;
  final String name;
  final String email;
  final String handphone;
  final String role;

  UserDetail(
      {required this.id,
      required this.name,
      required this.email,
      required this.handphone,
      required this.role});

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json['id'] ?? 0,
        name: json['name'] ?? 'null',
        email: json['email'] ?? 'null',
        handphone: json['handphone'] ?? 'null',
        role: json['role'] ?? 'null',
);
}