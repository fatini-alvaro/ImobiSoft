import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trabalho_imobiliaria/model/imovel_model.dart';

class PrefsService {
  static final String _key = 'imoveis';

  static Future<void> saveImovel(ImovelModel imovel) async {
    var prefs = await SharedPreferences.getInstance();
    var imoveis = await getImoveis();
    int newId = imoveis.isNotEmpty ? imoveis.map((imovel) => imovel.id ?? 0).reduce((max, id) => max > id ? max : id) + 1 : 1;
    imovel = imovel.copyWith(id: newId);
    imoveis.add(imovel);
    var jsonString = jsonEncode(imoveis.map((imovel) => imovel.toJson()).toList());
    prefs.setString(_key, jsonString);
  }

  static Future<List<ImovelModel>> getImoveis() async {
    var prefs = await SharedPreferences.getInstance();
    var jsonString = prefs.getString(_key);
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => ImovelModel.fromJson(json)).toList();
    }
    return [];
  }
  
  static Future<void> deleteImovel(int id) async {
    var prefs = await SharedPreferences.getInstance();
    var imoveis = await getImoveis();
    imoveis.removeWhere((imovel) => imovel.id == id);
    var jsonString = jsonEncode(imoveis.map((imovel) => imovel.toJson()).toList());
    prefs.setString(_key, jsonString);
  }
}
