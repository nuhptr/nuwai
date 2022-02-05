import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({
    required this.dataUser,
    this.tokenType,
    this.accessToken,
    this.userToken,
  });

  final DataUser? dataUser;
  final String? tokenType;
  final String? accessToken;
  final String? userToken;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      dataUser: json['user'] != null
          ? DataUser.fromJson(json['user'])
          : DataUser.initial(json),
      tokenType: json['token_type'],
      accessToken: json['access_token'],
      userToken: json['token_type'] + '' + json['access_token'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (dataUser != null) {
      data['user'] = dataUser?.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        dataUser,
        userToken,
        accessToken,
        tokenType,
      ];
}

class DataInital {}

class DataUser extends Equatable {
  DataUser({
    this.id,
    this.name,
    this.email,
    this.cvPath,
    this.alamat,
    this.photoProfile,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? cvPath;
  final String? alamat;
  final String? photoProfile;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      cvPath: json['cv_path'],
      alamat: json['alamat'],
      photoProfile: json['profile_photo_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  factory DataUser.initial(Map<String, dynamic> json) => DataUser();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['alamat'] = alamat;
    data['profile_photo_path'] = photoProfile;
    data['cv_path'] = cvPath;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        cvPath,
        alamat,
        photoProfile,
        createdAt,
        updatedAt,
      ];
}
