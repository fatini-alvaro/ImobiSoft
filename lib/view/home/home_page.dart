import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/components/buttons/custom_abrir_tela_adicionar_novo_button_component.dart';
import 'package:trabalho_imobiliaria/components/cards/custom_imovel_card.dart';
import 'package:trabalho_imobiliaria/controller/selecionar_imovel/selecionar_imovel_controller.dart';
import 'package:trabalho_imobiliaria/dao/imovel_dao.dart';
import 'package:trabalho_imobiliaria/model/imovel_model.dart';
import 'package:trabalho_imobiliaria/services/prefs_service.dart';
import 'package:trabalho_imobiliaria/utils/dialogs.dart';
import 'package:trabalho_imobiliaria/view/imovel/cadastrar_imovel_page.dart';
import 'package:trabalho_imobiliaria/widgets/custom_appbar_widget.dart';
import 'package:trabalho_imobiliaria/widgets/custom_drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  final SelecionarImovelController _imovelController = SelecionarImovelController();

  List<ImovelModel> imoveis = [];
  final _dao = ImovelDao();

  @override
  void initState() {
    super.initState();
    _loadImoveis();
  }

  Future<void> _loadImoveis() async {
    //List<ImovelModel> loadedImoveis = await PrefsService.getImoveis();
    List<ImovelModel> loadedImoveis = await _dao.lista();
    setState(() {
      imoveis = loadedImoveis;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawerWidget(
        accountName: 'Alvaro',
        accountEmail: 'alvaro@gmail.com',
        onHomeTap: () {
          print('Home tapped');
        },
        onLogoutTap: () {
          Navigator.of(context).pushNamedAndRemoveUntil('/splash', (_) => true);
        },
      ),
      appBar: CustomAppBarWidget(titulo: Text('ImobiSoft')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomAbrirTelaAdicionarNovoButtonComponent(
                buttonText: 'Cadastrar Novo Imovel', 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastrarImovelPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
          ..._buildImovelRows()
          ]
        ),
      ),
    );
  }

  List<Widget> _buildImovelRows() {
    List<Widget> rows = [];
    for (int i = 0; i < imoveis.length; i += 2) {
      if (i + 1 < imoveis.length) {
        rows.add(Row(
          children: [
            Expanded(
              child: CustomImovelCard(
                key: Key(imoveis[i].numero.toString()),
                imovel: imoveis[i],
                onExcluirPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Confirmar exclusão'),
                      content: Text('Tem certeza de que deseja excluir o imóvel ${imoveis[i].numero}?'),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context); // Fechar o diálogo de confirmação
                            await _imovelController.delete(context, imoveis[i].id!);

                            Dialogs.successToast(context, 'Imovel excluído com sucesso!');

                            _loadImoveis();
                          },
                          child: Text('Confirmar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Fechar o diálogo de confirmação
                          },
                          child: Text('Cancelar'),
                        ),
                      ],
                    ),
                  );
                }, 
              ),
            ),
            Expanded(
              child: CustomImovelCard(
                key: Key(imoveis[i + 1].numero.toString()),
                imovel: imoveis[i + 1],
                onExcluirPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Confirmar exclusão'),
                      content: Text('Tem certeza de que deseja excluir o imóvel ${imoveis[i + 1].numero}?'),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context); // Fechar o diálogo de confirmação
                            await _imovelController.delete(context, imoveis[i + 1].id!);

                            Dialogs.successToast(context, 'Imovel excluído com sucesso!');

                            _loadImoveis();
                          },
                          child: Text('Confirmar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Fechar o diálogo de confirmação
                          },
                          child: Text('Cancelar'),
                        ),
                      ],
                    ),
                  );
                },   
              ),
            ),
          ],
        ));
      } else {
        rows.add(Row(
          children: [
            Expanded(
              child: CustomImovelCard(
                key: Key(imoveis[i].numero.toString()),
                imovel: imoveis[i],
                onExcluirPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Confirmar exclusão'),
                      content: Text('Tem certeza de que deseja excluir o imóvel ${imoveis[i].numero}?'),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context); // Fechar o diálogo de confirmação
                            await _imovelController.delete(context, imoveis[i].id!);

                            Dialogs.successToast(context, 'Imovel excluído com sucesso!');

                            _loadImoveis();
                          },
                          child: Text('Confirmar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Fechar o diálogo de confirmação
                          },
                          child: Text('Cancelar'),
                        ),
                      ],
                    ),
                  );
                },   
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ));
      }
    }
    return rows;
  }
}
