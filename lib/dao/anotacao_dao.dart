

import 'package:trabalho_imobiliaria/database/database_provider.dart';
import 'package:trabalho_imobiliaria/model/anotacao_model.dart';

class AnotacaoDao{
  final dbProvider = DatabaseProvider.instance;

  Future<bool> salvar(AnotacaoModel anotacao) async{
    final db = await dbProvider.database;
    final valores = anotacao.toJson();

    await db.insert('ANOTACAO', valores);
    return true;
  }

  Future<bool> remover(int id) async{
    final db = await dbProvider.database;
    final removerRegistro = await db.delete(
      'ANOTACAO', 
      where: 'ID = ?',
      whereArgs: [id]
      );
    return removerRegistro > 0;
  }


  Future<List<AnotacaoModel>> lista() async{
    final db = await dbProvider.database;

    final resultado = await db.query(
      'ANOTACAO', 
      columns: ['ID', 'DESCRICAO', 'IMOVEL'],
      orderBy: 'ID DESC',
      );
      return resultado.map((m) => AnotacaoModel.fromJson(m)).toList();
  }
}