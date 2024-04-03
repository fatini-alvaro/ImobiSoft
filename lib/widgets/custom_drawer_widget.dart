import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  final String accountName;
  final String accountEmail;
  final Function() onHomeTap;
  final Function() onLogoutTap;

  CustomDrawerWidget({
    required this.accountName,
    required this.accountEmail,
    required this.onHomeTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset('assets/images/logo.jpg'),
            ),
            accountName: Text(accountName),
            accountEmail: Text(accountEmail),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            subtitle: Text('Tela de Inicio'),
            onTap: onHomeTap,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            subtitle: Text('Sair do seu usuário'),
            onTap: onLogoutTap,
          ),
          // ListTile(
          //   leading: Icon(Icons.brightness_6), // Ícone para trocar tema
          //   title: Text('Trocar Tema'),
          //   subtitle: Text('Alterar entre tema claro e escuro'),
          //   onTap: () {
          //     AppController.instance.changeTheme(); 
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
