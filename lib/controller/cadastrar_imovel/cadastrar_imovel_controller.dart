
import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/model/imovel_model.dart';
import 'package:trabalho_imobiliaria/services/prefs_service.dart';
import 'package:trabalho_imobiliaria/utils/dialogs.dart';


class CadastrarImovelController with ChangeNotifier {

  String? _numero;
  setNumero(String value) => _numero = value;
  String? get numero => _numero;

  String? _cidade;
  setCidade(String value) => _cidade = value;
  String? get cidade => _cidade;

  String? _rua;
  setRua(String value) => _rua = value;
  String? get rua => _rua;

  Future<bool> create(BuildContext context) async {

    Dialogs.showLoading(context, message:'Aguarde, Criando Imóvel');

    try {
      
      ImovelModel imovel = ImovelModel(numero: _numero, rua: _cidade, cidade: _rua);
      
      await PrefsService.saveImovel(imovel);

      Dialogs.hideLoading(context);
      Dialogs.successToast(context, 'Imóvel criado com sucesso');
      return true;
    } catch (e) {
      print(e);
      Dialogs.hideLoading(context);
      Dialogs.errorToast(context, 'Falha ao criar o Imóvel');
      return false;
    }
    
  }
}