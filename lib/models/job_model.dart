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

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      namaPekerjaan: json['nama_pekerjaan'],
      deskripsi: json['deskripsi'],
      namaPerusahaan: json['nama_perusahaan'],
      gaji: json['gaji'],
      logoPerusahaanPath: json['logo_perusahaan_path'],
      fotoLowongan: json['foto_lowongan'],
      tentangPembukaLowongan: json['tentang_pembuka_lowongan'],
      tenggangWaktuPekerjaan: DateTime.parse(json['tenggang_waktu_pekerjaan']),
      lokasiPekerjaan: json['lokasi_pekerjaan'],
      kategori: json['kategori'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_pekerjaan'] = namaPekerjaan;
    data['nama_perusahaan'] = namaPerusahaan;
    data['deskripsi'] = deskripsi;
    data['gaji'] = gaji;
    data['logo_perusahaan'] = logoPerusahaanPath;
    data['foto_lowongan'] = fotoLowongan;
    data['tentang_pembuka_lowongan'] = tentangPembukaLowongan;
    data['tenggang_waktu_pekerjaan'] = tenggangWaktuPekerjaan;
    data['kategori'] = kategori;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    return data;
  }

  @override
  List<Object?> get props => [
        id,
        namaPekerjaan,
        kategori,
        deskripsi,
        namaPerusahaan,
        gaji,
        lokasiPekerjaan,
        logoPerusahaanPath,
        fotoLowongan,
        tentangPembukaLowongan,
        tenggangWaktuPekerjaan,
        createdAt,
        updatedAt,
      ];
}
