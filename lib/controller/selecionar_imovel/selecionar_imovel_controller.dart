import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/services/prefs_service.dart';

class SelecionarImovelController {
  
  Future<bool> delete(BuildContext context, int imovelId) async {
    
    await PrefsService.deleteImovel(imovelId);

    return true;
  }
}