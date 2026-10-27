import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  // controladores para os campos de texto
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  // variável para o resultado da informação do IMC
  String _infoText = 'Informe seus dados!';
  // função para resetar os campos de texto e a variável de resultado
  void _resetFields() {
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      _infoText = 'Informe seus dados!';
    });
  }

  void _calculate() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura); 
      if (imc < 18.6) {
        _infoText = 'Abaixo do peso: IMC (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = 'Peso ideal: IMC (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText =
            'Levemente acima do peso: IMC (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = 'Obesidade grau I : IMC (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = 'Obesidade grau II: IMC(${imc.toStringAsPrecision(4)})';
      } else if (imc >= 40) {
        _infoText = 'Obesidade grau III: IMC (${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
		appBar: AppBar(
			title: const Text(
				'Calculadora de IMC',
				style: TextStyle(color: Colors.white),
			), // Text
			backgroundColor: const Color(0xFF109940),
			iconTheme: const IconThemeData(color: Colors.white),
			centerTitle: true,
			actions: [
				IconButton(
					onPressed: _resetFields,
					icon: Icon(
						Icons.refresh,
						color: Colors.white,
					), // icon
				), // IconButton
			], // actions
		), // AppBar
		body: SingleChildScrollView(
			padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: [
					Icon(Icons.person_outline, size: 120, color: Colors.green),
					TextField(
					keyboardType: TextInputType.number,
					textAlign: TextAlign.center,
					style: TextStyle(color: Colors.green, fontSize: 25),
					// decoração do campo de texto
					decoration: InputDecoration(
						labelText: 'Peso (kg)',
						labelStyle: TextStyle(color: Colors.green),
					), // decoration: InputDecoration(
					controller: pesoController,
					), // TextField
					SizedBox(height: 20),
					TextField(
					keyboardType: TextInputType.number,
					textAlign: TextAlign.center,
					style: TextStyle(color: Colors.green, fontSize: 25),
					// decoração do campo de texto
					decoration: InputDecoration(
						labelText: 'Altura (cm)',
						labelStyle: TextStyle(color: Colors.green),
					), // decoration: InputDecoration
					controller: alturaController,
					), // TextField
					SizedBox(height: 20),
					Padding(
					padding: const EdgeInsets.all(8.0),
					child: SizedBox(
						height: 50,
						child: ElevatedButton(
						onPressed: _calculate,
						// ignore: sort_child_properties_last
						child: Text(
							'Calcular',
							style: TextStyle(color: Colors.white, fontSize: 25),
						), // Text
						style: ElevatedButton.styleFrom(
							backgroundColor: Colors.green,
						), // style: ElevatedButton.styleFrom(
						), // Elevated Button
					), // child sizedBox
					), // Padding
					SizedBox(height: 20),
					Text(
					_infoText,
					textAlign: TextAlign.center,
					style: TextStyle(color: Colors.green, fontSize: 25),
					),
					Row(
					
					mainAxisAlignment: MainAxisAlignment.center,
					
					children: <Widget>[
						const SizedBox(width: 20.0, height: 100.0),
						const Text('Sou', style: TextStyle(fontSize: 43.0, color: Colors.green)),
						const SizedBox(width: 20.0, height: 100.0),
						DefaultTextStyle(
							style: const TextStyle(fontSize: 40.0, fontFamily: 'Horizon', color: Colors.green),
							child: AnimatedTextKit(
								animatedTexts: [
								RotateAnimatedText('LINDO'),
								RotateAnimatedText('MARAVILHOSO'),
								RotateAnimatedText('DIFERENTE'),
								],
								onTap: () {
								print("Tap Event");
								}, // on Tap
								), // DefaultTextStyle
							),
						],
					),
				],//Child
			),// Column
		), // SingleChildScrollView
	); //
	}
}