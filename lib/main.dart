import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resultScreen.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImcPage(),
    );
  }
}

class ImcPage extends StatefulWidget{
  _ImcPageState createState()=>_ImcPageState();
}

class _ImcPageState extends State<ImcPage>{
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  bool onButtonClick = false;
  double result= 0;

   @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('IMC'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: pesoController,
              decoration: InputDecoration(
              labelText: 'Peso (kg)',
              labelStyle: TextStyle(color: Colors.blue),
              border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
            ),
              TextField(
               // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: alturaController,
                decoration: InputDecoration(
                labelText: 'Altura (m)',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
            ),
            
            ElevatedButton(
              onPressed: (){
                
                final double peso = double.tryParse(pesoController.text) ?? 0;
                final double altura = double.tryParse(alturaController.text) ?? 0;
                result = peso / (altura * altura);
                String message = '';

                print(altura);
                onButtonClick = true;

                if(result<18.6){
                  print('Abaixo do peso ${result}');
                  message= 'Abaixo do peso';

                }else if(result>=18.6 && result<24.9){
                  print('Peso ideal ${result}');
                  message = 'Peso ideal';

                }else if(result>=24.9 && result<29.9){
                  print('Levemente acima do peso ${result}');
                  message = 'Levemente acima do peso';

                }else if(result>=29.9 && result<34.9){
                  print('Obesidade Grau I ${result}');
                  message = 'Obesidade Grau I';

                }else if(result>=34.9 && result<39.9){
                  print('Obesidade Grau II ${result}');
                  message = 'Obesidade Grau II';

                }else if(result>=40){
                  print('Gordão da XJ ${result}');
                  message = 'Gordão da XJ';
                }

                Navigator.push(context, MaterialPageRoute(builder: (context) => Result(result: result, message: message,)));
              },
              child: Text('Calcular'),
            ),
            Text('Resultado: $result'),
          ],
        ),
      ), 
    );
  }

}


