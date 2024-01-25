import 'dart:convert';

class DetailModel {
  final String nama;
  final String film;
  final String lagu;
  final int umur;
  DetailModel({
    this.nama = '',
    this.film = '',
    this.lagu = '',
    this.umur = 0,
  });

  DetailModel copyWith({
    String? nama,
    String? film,
    String? lagu,
    int? umur,
  }) {
    return DetailModel(
      nama: nama ?? this.nama,
      film: film ?? this.film,
      lagu: lagu ?? this.lagu,
      umur: umur ?? this.umur,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nama': nama});
    result.addAll({'film': film});
    result.addAll({'lagu': lagu});
    result.addAll({'umur': umur});

    return result;
  }

  factory DetailModel.fromMap(Map<String, dynamic> map) {
    return DetailModel(
      nama: map['nama'] ?? '',
      film: map['film'] ?? '',
      lagu: map['lagu'] ?? '',
      umur: map['umur']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailModel.fromJson(String source) => DetailModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DetailModel(nama: $nama, film: $film, lagu: $lagu, umur: $umur)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailModel && other.nama == nama && other.film == film && other.lagu == lagu && other.umur == umur;
  }

  @override
  int get hashCode {
    return nama.hashCode ^ film.hashCode ^ lagu.hashCode ^ umur.hashCode;
  }
}
