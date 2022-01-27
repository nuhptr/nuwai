import 'package:equatable/equatable.dart';

class JobModel extends Equatable {
  JobModel({
    this.id,
    this.namaPekerjaan,
    this.deskripsi,
    this.namaPerusahaan,
    this.gaji,
    this.logoPerusahaanPath,
    this.fotoLowongan,
    this.tentangPembukaLowongan,
    this.tenggangWaktuPekerjaan,
    this.lokasiPekerjaan,
    this.kategori,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? namaPekerjaan;
  final String? deskripsi;
  final String? namaPerusahaan;
  final num? gaji;
  final String? logoPerusahaanPath;
  final String? fotoLowongan;
  final String? tentangPembukaLowongan;
  final DateTime? tenggangWaktuPekerjaan;
  final String? lokasiPekerjaan;
  final String? kategori;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
     id = json['id'];
    namaPekerjaan = json['nama_pekerjaan'];
    deskripsi = json['deskripsi'];
    namaPerusahaan = json['nama_perusahaan'];
    gaji = json['gaji'];
    logoPerusahaanPath = json['logo_perusahaan_path'];
    fotoLowongan = json['foto_lowongan'];
    tentangPembukaLowongan = json['tentang_pembuka_lowongan'];
    tenggangWaktuPekerjaan = DateTime.parse(json['tenggang_waktu_pekerjaan']);
    lokasiPekerjaan = json['lokasi_pekerjaan'];
    kategori = json['kategori'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_pekerjaan': namaPekerjaan,
      'nama_perusahaan': namaPerusahaan,
      'deskripsi': deskripsi,
      'gaji': gaji,
      'logo_perusahaan_path': logoPerusahaanPath,
      'foto_lowongan': fotoLowongan,
      'tentang_pembuka_lowongan': tentangPembukaLowongan,
      'tenggang_waktu_lamaran': tenggangWaktuPekerjaan,
      'kategori': kategori,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
   
  }

  


