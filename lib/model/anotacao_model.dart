class AnotacaoModel {
  final int? id;
  final String? descricao;
  final int? imovel;

  AnotacaoModel({
    this.id,
    this.descricao,
    this.imovel,
  });

  AnotacaoModel copyWith({
    int? id,
    String? descricao,
    int? imovel
  }) {
    return AnotacaoModel(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      imovel: imovel ?? this.imovel
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'imovel': imovel,
    };
  }

  factory AnotacaoModel.fromJson(Map<String, dynamic> json) {
    return AnotacaoModel(
      id: json['ID'],
      descricao: json['DESCRICAO'],
      imovel: json['IMOVEL'],
    );
  }
}
