/* arquivo sobre.dart
exibir:
nome
objetivo do  app*/

import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre o Aplicativo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 100,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              const Text(
                'Desenvolvido por:',
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'Elias Santos',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Objetivo do aplicativo:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Este aplicativo tem como objetivo calcular o '
                'Índice de Massa Corporal (IMC) a partir do peso '
                'e da altura do usuário, apresentando uma '
                'classificação do resultado para auxiliar no '
                'acompanhamento da saúde.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

