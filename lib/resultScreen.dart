import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;
  final String message;

  const Result({Key? key, required this.result, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seu IMC é: ${result.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              message,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

}