import 'package:equatable/equatable.dart';

class WorkModel extends Equatable {
  WorkModel({
    this.id,
    this.idJob,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? idJob;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory WorkModel.fromJson(Map<String, dynamic> json) {
    return WorkModel(
      id: json['id'],
      idJob: json['id_pekerjaan'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        idJob,
        createdAt,
        updatedAt,
      ];
}
