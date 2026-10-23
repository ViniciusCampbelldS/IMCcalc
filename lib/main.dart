import 'package:flutter/material.dart';

void main(){
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
    return MaterialApp(
		debugShowCheckedModeBanner: false,
    	home: Home(),
		); // MaterialApp
	}
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
	@override
	Widget build(BuildContext context) {
	return Scaffold(
		appBar: AppBar(
			title: Text(
        		'Calculadora de IMC',
        		style: TextStyle(
					fontSize: 30,
					backgroundColor: const Color(0x109940FF),
					color: Colors.white,
					fontWeight: FontWeight.bold),
					textAlign: TextAlign.center,
        	), // Text
        	centerTitle: true,
			actions: [
				IconButton(
					onPressed: (){},
					icon: Icon(
						Icons.refresh,
						color: Colors.white,
					), // icon
				), // IconButton
			], // actions
		), // AppBar
		backgroundColor: Colors.white,
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
							),
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
									onPressed: () {},
									//ignore: sort_child_prperies_last
									child: Text(
										'Calcular', style: TextStyle(
											color: Colors.white,
											fontSize: 25
											),
										),
								), // ElevatedButton
							), //SizedBox
						), // Padding
						SizedBox(
							height: 20,
						), // SizedBox
						Text(
							'Informe seus dados.',
							textAlign: TextAlign.center,
							style: TextStyle(
								color: Colors.green,
								fontSize: 25
							),
						), // Text
					], // children
				), // Column
			), //SingleChildScrollView
		); // Scaffold
	} // build
} // _HomeState
