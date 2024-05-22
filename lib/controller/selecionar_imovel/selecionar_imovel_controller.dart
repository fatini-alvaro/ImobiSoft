import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/dao/imovel_dao.dart';

class SelecionarImovelController {

  final _dao = ImovelDao();
  
  Future<bool> delete(BuildContext context, int imovelId) async {
    
    //await PrefsService.deleteImovel(imovelId);
    await _dao.remover(imovelId);

    return true;
  }
}