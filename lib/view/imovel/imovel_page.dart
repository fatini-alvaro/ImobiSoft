import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/model/imovel_model.dart';
import 'package:trabalho_imobiliaria/themes/themes.dart';

class ImovelPage extends StatefulWidget {

  final ImovelModel? imovel;

  ImovelPage({Key? key, this.imovel}) : super(key: key);

  @override
  State<ImovelPage> createState() {
    return ImovelPageState();
  }
}

class ImovelPageState extends State<ImovelPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppThemes.lightTheme.primaryColor,
          foregroundColor: Colors.white,
          title: Text('Imóvel ${widget.imovel?.numero ?? ''}'),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.white,            
            tabs: [
              Tab(
                text: 'Ações',
              ),
              Tab(
                text: 'Informações'
              ),
            ],
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 5.0, 
                ),
              ),
            ),
            labelStyle: TextStyle(fontSize: 18),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Center(
                child: Text('Conteúdo da aba Ações'),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  _buildInfoRow('Número', widget.imovel?.numero ?? ''),
                  _buildInfoRow('Cidade', widget.imovel?.cidade ?? ''),
                  _buildInfoRow('Rua', widget.imovel?.rua ?? ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }


}