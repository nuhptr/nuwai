import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.cvPath,
    this.alamat,
    this.photoProfile,
    this.createdAt,
    this.updatedAt,
    this.token = '',
  });

  final int? id;
  final String? name;
  final String? email;
  final String? cvPath;
  final String? alamat;
  final String? photoProfile;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        cvPath: json['cv_path'],
        alamat: json['alamat'],
        photoProfile: json['profile_photo_url'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        token: json['token'],
      );

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'alamat': alamat,
        'profile_photo_path': photoProfile,
        'cv_path': cvPath,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'token': token,
      };

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
        token,
      ];
}
