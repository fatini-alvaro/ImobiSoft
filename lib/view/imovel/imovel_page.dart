import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/components/buttons/custom_salvar_cadastro_button_component.dart';
import 'package:trabalho_imobiliaria/controller/tela_imovel/tela_imovel_controller.dart';
import 'package:trabalho_imobiliaria/model/imovel_model.dart';
import 'package:trabalho_imobiliaria/themes/themes.dart';
import 'package:trabalho_imobiliaria/widgets/custom_text_form_field_widget.dart';

class ImovelPage extends StatefulWidget {

  final ImovelModel? imovel;

  ImovelPage({Key? key, this.imovel}) : super(key: key);

  @override
  State<ImovelPage> createState() {
    return ImovelPageState();
  }
}

class ImovelPageState extends State<ImovelPage> {
  final TelaImovelController _telaImovelController =
      TelaImovelController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      CustomTextFormFieldWidget(
                        label: 'Anotação',
                        hintText: 'Informar uma anotação',
                        onChanged: _telaImovelController.setDescricao,  
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo Obrigatório';
                          }
                          return null;
                        },            
                      ),
                      SizedBox(height: 20),          
                      CustomSalvarCadastroButtonComponent(
                        buttonText: 'Salvar Anotação',
                        onPressed: () {    
                          if (_formKey.currentState!.validate()) {
                            _telaImovelController
                                .create(context);
                          }                           
                        },
                      ),
                    ],
                  ),
                ),
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