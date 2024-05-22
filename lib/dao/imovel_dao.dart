

import 'package:trabalho_imobiliaria/database/database_provider.dart';
import 'package:trabalho_imobiliaria/model/anotacao_model.dart';
import 'package:trabalho_imobiliaria/model/imovel_model.dart';

class ImovelDao{
  final dbProvider = DatabaseProvider.instance;

  Future<bool> salvar(ImovelModel imovel) async{
    final db = await dbProvider.database;
    final valores = imovel.toJson();

    if(imovel.id == null){
      await db.insert('IMOVEL', valores);
      return true;
    }else{
      final registrosAtualizados = await db.update(
        'IMOVEL', 
        valores, 
        where: 'ID = ?',
        whereArgs: [imovel.id]
      );
      return registrosAtualizados > 0;
    }
  }

  Future<bool> remover(int id) async{
    final db = await dbProvider.database;
    final removerRegistro = await db.delete(
      'IMOVEL', 
      where: 'ID = ?',
      whereArgs: [id]
      );
    return removerRegistro > 0;
  }


  Future<List<ImovelModel>> lista() async{
    final db = await dbProvider.database;

    final resultado = await db.query(
      'IMOVEL', 
      columns: ['ID', 'NUMERO', 'RUA', 'CIDADE'],
      orderBy: 'ID DESC',
      );
      return resultado.map((m) => ImovelModel.fromJson(m)).toList();
  }

  Future<List<AnotacaoModel>> listaAnotacoes(int id) async{
    final db = await dbProvider.database;

    final resultado = await db.query(
      'ANOTACAO', 
      columns: ['ID', 'DESCRICAO'],
      where: 'IMOVEL = ?',
      whereArgs: [id],
      orderBy: 'ID DESC',
      );
      return resultado.map((m) => AnotacaoModel.fromJson(m)).toList();
  }  

}