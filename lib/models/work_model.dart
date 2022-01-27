import 'package:equatable/equatable.dart';

class WorkModel extends Equatable {
  WorkModel({
    this.id,
    this.idPekerjaan,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? idPekerjaan;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        id: json['id'],
        idPekerjaan: json['id_pekerjaan'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  @override
  List<Object?> get props => [
        id,
        idPekerjaan,
        createdAt,
        updatedAt,
      ];
}
