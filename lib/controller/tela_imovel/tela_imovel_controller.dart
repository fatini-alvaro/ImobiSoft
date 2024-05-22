
import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/dao/anotacao_dao.dart';
import 'package:trabalho_imobiliaria/model/anotacao_model.dart';
import 'package:trabalho_imobiliaria/utils/dialogs.dart';


class TelaImovelController with ChangeNotifier {

  String? _descricao;
  setDescricao(String value) => _descricao = value;
  String? get descricao => _descricao;

  final _dao = AnotacaoDao();

  Future<bool> create(BuildContext context, int imovelID) async {

    Dialogs.showLoading(context, message:'Aguarde, salvando anotação');

    try {   

      AnotacaoModel anotacao = AnotacaoModel(descricao: _descricao, imovel: imovelID);

      await _dao.salvar(anotacao);
      
      Dialogs.hideLoading(context);
      Dialogs.successToast(context, 'Anotação criada com sucesso');
      return true;
    } catch (e) {
      print(e);
      Dialogs.hideLoading(context);
      Dialogs.errorToast(context, 'Falha ao salvar anotação');
      return false;
    }
    
  }
}