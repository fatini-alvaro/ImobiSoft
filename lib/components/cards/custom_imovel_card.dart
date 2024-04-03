import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/model/imovel_model.dart';
import 'package:trabalho_imobiliaria/themes/themes.dart';
import 'package:trabalho_imobiliaria/view/imovel/imovel_page.dart';

class CustomImovelCard extends StatelessWidget {
  final ImovelModel imovel;
  final VoidCallback onExcluirPressed;

  const CustomImovelCard({
    Key? key,
    required this.imovel,
    required this.onExcluirPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      height: 170,
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImovelPage(
                imovel: imovel,
              ),
            ),
          )
        },
        child: Card(
          color: AppThemes.lightTheme.primaryColor,
          elevation: 7,
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 10,
                child: Container(
                  width: 150, // Ajuste este valor conforme necessário
                  height: 40,
                  child: Text(
                    'Nº - ${imovel.numero}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 10,
                child: Container(
                  width: 150, // Ajuste este valor conforme necessário
                  height: 80,
                  child: Text(
                    '${imovel.cidade}, ${imovel.rua}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: onExcluirPressed,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
