import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'sobre.dart';

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
  
}

class Home extends StatefulWidget {
	const Home({super.key});
	
	@override
	State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
	// controladores para os campos de texto
	TextEditingController pesoController = TextEditingController();
	TextEditingController alturaController = TextEditingController();
	// variável para o resultado da informação do IMC
	String _infoText = 'Informe seus dados. ';
	
	//função para resetar os campos de texto e a variável de resultado
	void _resetFields(){
		pesoController.text = '';
		alturaController.text = '';
		setState(() {
			_infoText = 'Informe seus dados. ';
		});
	}
	
	void _calculate() {
    setState(() {
		double peso = double.parse(pesoController.text);
		double altura = double.parse(alturaController.text) / 100;
		double imc = peso / (altura * altura);
		if (imc < 18.6) {
			_infoText = 'Abaixo do peso (${imc.toStringAsPrecision(4)})';
		} else if (imc >= 18.6 && imc < 24.9) {
			_infoText = 'Peso ideal (${imc.toStringAsPrecision(4)})';
		} else if (imc >= 24.9 && imc < 29.9) {
			_infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(4)})';
		} else if (imc >= 29.9 && imc < 34.9) {
			_infoText = 'Obesidade grau I (${imc.toStringAsPrecision(4)})';
		} else if (imc >= 34.9 && imc < 39.9) {
			_infoText = 'Obesidade grau II (${imc.toStringAsPrecision(4)})';
		} else if (imc >= 40) {
			_infoText = 'Obesidade grau III (${imc.toStringAsPrecision(4)})';
		}
		});
	}
	
	@override
	Widget build(BuildContext context) {
		
		return Scaffold(
			// opções de menu superior
			drawer: Drawer (
				child: ListView(
					children:[
						DrawerHeader(
							decoration: BoxDecoration(
								color: Colors.green,
							),
							child: Text(
								'Menu',
								style: TextStyle(
								color: Colors.white,
								fontSize: 24,
								), // TextStyle
							), // Text
							), // DrawerHeader
							ListTile(title: Text('Calculo IMC'), onTap: () {}),
							ListTile(title: Text('Sobre'), onTap: () {
								Navigator.push( 
									context,
									MaterialPageRoute(builder: (context) => const Sobre()),
								); // Navigator.push
							} // ListTitle
						), // ListTitle
					] // children
				) // ListView
			), // Drawer
			body: SingleChildScrollView(
				padding: EdgeInsets.fromLTRB(10,0,10,0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: [
						Icon(
							Icons.person_outline,
							size: 120,
							color: Colors.green
						), // Icons
						SizedBox(
							height: 20,
						), //SizedBox
						TextField(
						keyboardType: TextInputType.number,
						textAlign: TextAlign.center,
						style: TextStyle(
							color: Colors.green,
							fontSize: 25
							), // TextStyle
						// decoração do campo de texto
						decoration: InputDecoration(
							labelText: 'Peso (kg)',
							labelStyle: TextStyle(color: Colors.green),
							),
						controller: pesoController,
						), // TextField
						SizedBox(
							height: 20,
						), //SizedBox
						TextField(
							keyboardType: TextInputType.number,
							textAlign: TextAlign.center,
							style: TextStyle(
								color: Colors.green,
								fontSize: 25
								),
							// decoração do campo de texto
							decoration: InputDecoration(
								labelText: 'Altura (cm)',
								labelStyle: TextStyle(color: Colors.green),
								),
							controller: alturaController,
						), // TextField
						SizedBox(
							height: 20,
						), //SizedBox
						Padding(
							padding: const EdgeInsets.all(8.0),
							child: SizedBox(
								height: 50,
								child: ElevatedButton(
									onPressed: _calculate,
									//ignore: sort_child_prperies_last
									child: Text(
										'Calcular',
										style: TextStyle(
											color: Colors.white,
											fontSize: 25,
											), // TextStyle
										), // Style
										style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF109940),),// Cor de fundo verde
								), // ElevatedButton
							), //SizedBox
						), // Padding
						SizedBox(
							height: 20,
						), // SizedBox
						Text(
							_infoText,
							textAlign: TextAlign.center,
							style: TextStyle(
								color: Colors.green,
								fontSize: 25
							), // style: TextStyle
						), // Text
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
										], // animatedTexts
										onTap: () {
											print("Tap Event");
										}, // onTap
									), // AnimatedTextKit
								), // DefaultTextStyle
							], // children: <widget>[
						), // Row
					], // children[
				),// child: Column(
			),// body: SingleChildScrollView(
			appBar: AppBar(
				centerTitle: true,
				title: Text(
					'Calculadora de IMC',
					textAlign: TextAlign.center,
					style: TextStyle(
						fontSize: 30,
						color: Colors.white,
						backgroundColor: const Color(0xFF109940),
						fontWeight: FontWeight.bold,
					), // TextStyle
				), // Text
				actions: [
					IconButton(
						onPressed: _resetFields,
						icon: Icon(
							Icons.refresh,
							color: Colors.white,
						), // icon
					), // IconButton
				], // actions
				backgroundColor: Colors.white,
			), // AppBar
		); // return Scaffold(
	}// build (){
} // _HomeState
