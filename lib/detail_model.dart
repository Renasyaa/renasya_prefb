import 'dart:convert';

class DetailModel {
  final String nama;
  final String namaOrangTua;
  final int umur;

  DetailModel({
    this.nama = '',
    this.namaOrangTua = '',
    this.umur = 0,
  });

  DetailModel copyWith({
    String? nama,
    String? namaOrangTua,
    int? umur,
  }) {
    return DetailModel(
      nama: nama ?? this.nama,
      namaOrangTua: namaOrangTua ?? this.namaOrangTua,
      umur: umur ?? this.umur,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nama': nama});
    result.addAll({'nama_orang_tua': namaOrangTua});
    result.addAll({'umur': umur});

    return result;
  }

  factory DetailModel.fromMap(Map<String, dynamic> map) {
    return DetailModel(
      nama: map['nama'] ?? '',
      namaOrangTua: map['nama_orang_tua'] ?? '',
      umur: map['umur']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailModel.fromJson(String source) => DetailModel.fromMap(json.decode(source));

  @override
  String toString() => 'DetailModel(nama: $nama, namaOrangTua: $namaOrangTua, umur: $umur)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailModel && other.nama == nama && other.namaOrangTua == namaOrangTua && other.umur == umur;
  }

  @override
  int get hashCode => nama.hashCode ^ namaOrangTua.hashCode ^ umur.hashCode;
}
