import 'package:flutter/material.dart';

class CustomSalvarCadastroButtonComponent extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  CustomSalvarCadastroButtonComponent({
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}