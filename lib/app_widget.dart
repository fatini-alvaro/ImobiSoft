import 'package:flutter/material.dart';
import 'package:trabalho_imobiliaria/controller/app_controller.dart';
import 'package:trabalho_imobiliaria/themes/themes.dart';
import 'package:trabalho_imobiliaria/view/home/home_page.dart';
import 'package:trabalho_imobiliaria/view/splash/splash_page.dart';

class AppWidget extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
      return MaterialApp(
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: AppController.instance.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/home': (context) => HomePage(),
        },
        debugShowCheckedModeBanner: false,
      );  
    });
  }
} 