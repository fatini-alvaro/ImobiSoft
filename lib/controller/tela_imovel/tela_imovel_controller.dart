
import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/utils/dialogs.dart';


class TelaImovelController with ChangeNotifier {

  String? _descricao;
  setDescricao(String value) => _descricao = value;
  String? get descricao => _descricao;

  Future<bool> create(BuildContext context) async {

    Dialogs.showLoading(context, message:'Aguarde, salvando anotação');

    try {      
      
      Dialogs.hideLoading(context);
      Dialogs.successToast(context, 'Imóvel criado com sucesso');
      return true;
    } catch (e) {
      print(e);
      Dialogs.hideLoading(context);
      Dialogs.errorToast(context, 'Falha ao salvar anotação');
      return false;
    }
    
  }
}