import 'dart:html';

import 'package:flutter/material.dart';

class Exercicio extends StatefulWidget {
  const Exercicio({Key? key});

  @override
  _ExercicioState createState() => _ExercicioState();
}

class _ExercicioState extends State<Exercicio> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 29, 67),
        title: Text(
          "Descontos para Loja - Felipe Valeriano",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // Largura desejada
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Qual o valor da Compra?',
                ),
              ),
              SizedBox(height: 20), // Espaço vertical entre o TextField e o Dropdown
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Cliente Comum (1)', 'Funcionario (2)', 'Vip(3)']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () {
              },
              child: Text('Calcular Compra Total'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
