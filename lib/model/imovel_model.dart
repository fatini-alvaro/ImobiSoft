class ImovelModel {
  final int? id;
  final String? numero;
  final String? rua;
  final String? cidade;

  ImovelModel({
    this.id,
    this.numero,
    this.rua,
    this.cidade,
  });

  ImovelModel copyWith({
    int? id,
    String? numero,
    String? rua,
    String? cidade,
  }) {
    return ImovelModel(
      id: id ?? this.id,
      numero: numero ?? this.numero,
      rua: rua ?? this.rua,
      cidade: cidade ?? this.cidade,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'numero': numero,
      'rua': rua,
      'cidade': cidade,
    };
  }

  factory ImovelModel.fromJson(Map<String, dynamic> json) {
    return ImovelModel(
      id: json['id'],
      numero: json['numero'],
      rua: json['rua'],
      cidade: json['cidade'],
    );
  }
}
