import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/components/buttons/custom_salvar_cadastro_button_component.dart';
import 'package:trabalho_imobiliaria/controller/cadastrar_imovel/cadastrar_imovel_controller.dart';
import 'package:trabalho_imobiliaria/themes/themes.dart';
import 'package:trabalho_imobiliaria/view/home/home_page.dart';
import 'package:trabalho_imobiliaria/widgets/custom_text_form_field_widget.dart';

class CadastrarImovelPage extends StatefulWidget {  

  CadastrarImovelPage({Key? key}) : super(key: key);

  @override
  State<CadastrarImovelPage> createState() {
    return CadastrarImovelPageState();
  }
}

class CadastrarImovelPageState extends State<CadastrarImovelPage> {
  final CadastrarImovelController _cadastrarImovelController =
      CadastrarImovelController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.lightTheme.primaryColor,
        foregroundColor: Colors.white,
        title: Text('Cadastrar Imovel'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomTextFormFieldWidget(
                label: 'Número',
                hintText: 'Número do imovel',
                onChanged: _cadastrarImovelController.setNumero,  
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },            
              ),
              SizedBox(height: 20),   
              CustomTextFormFieldWidget(
                label: 'Cidade',
                hintText: 'Escreva o nome da cidade',
                onChanged: _cadastrarImovelController.setCidade,  
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },            
              ),
              SizedBox(height: 20),   
              CustomTextFormFieldWidget(
                label: 'Rua',
                hintText: 'Escreva o nome da rua',
                onChanged: _cadastrarImovelController.setRua,  
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },            
              ),
              SizedBox(height: 20),            
              Expanded(
                child: ListView(
                  children: [
                    // Adicione outros widgets aqui se necessário
                  ],
                ),
              ),
              CustomSalvarCadastroButtonComponent(
                buttonText: 'Salvar Imóvel',
                onPressed: () {    
                  if (_formKey.currentState!.validate()) {
                    _cadastrarImovelController
                        .create(context)
                        .then((resultado) {
                      if (resultado) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    });
                  }                           
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

