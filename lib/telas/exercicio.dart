import 'package:flutter/material.dart';

class Exercicio extends StatefulWidget {
  const Exercicio({Key? key});

  @override
  _ExercicioState createState() => _ExercicioState();
}

class _ExercicioState extends State<Exercicio> {
  String? dropdownValue;
  TextEditingController _valorCompraController = TextEditingController();
  String resultadoCompraComDesconto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 29, 67),
        title: const Text(
          "Aplicação de desconto para lojas - Felipe Valeriano",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                'Bem-vindo(a), preencha os dados para começar',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 60),
              TextField(
                controller: _valorCompraController, 
                decoration: InputDecoration(
                  labelText: 'Qual o valor da Compra?',
                ),
              ),

              const SizedBox(height: 20),
              DropdownButton<int>(
              value: dropdownValue == null ? null : int.parse(dropdownValue!), 
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              onChanged: (int? newValue) {
                setState(() {
                  dropdownValue = newValue.toString();
                });
              },
              items: const <DropdownMenuItem<int>>[
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Cliente Comum'),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text('Funcionário'),
                ),
                DropdownMenuItem<int>(
                  value: 3,
                  child: Text('VIP'),
                ),
                ],
              ),

              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  String valorCompra = _valorCompraController.text;
                  print('Valor da compra: $valorCompra');
                  AvaliaeCalcula(valorCompra, dropdownValue);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 29, 67),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calculate,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Calcular Compra Total',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
               TextField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Resultado da compra com desconto',
                  labelStyle: TextStyle(color: Colors.black)
  
                ),
                controller: TextEditingController(text: 'R\$' + resultadoCompraComDesconto),
                  style: TextStyle(color: Colors.black)
              ),

            ],
          ),
        ),
      ),
    );
  }


  void AvaliaeCalcula(String valorCompra, String? dropdownValue) { 
  int dropdownIntValue = int.tryParse(dropdownValue ?? '') ?? 0; 
  
  switch (dropdownIntValue) {
    case 1:
      setState(() {
        resultadoCompraComDesconto = ' $valorCompra';
      });
      break;
      
    case 2: 
      double valorComDesconto = double.parse(valorCompra) * 0.9;
      setState(() {
        resultadoCompraComDesconto = ' ${valorComDesconto.toStringAsFixed(2)}';
      });
      break;
      
    case 3:
      double valorComDesconto = double.parse(valorCompra) * 0.95;
      setState(() {
        resultadoCompraComDesconto = ' ${valorComDesconto.toStringAsFixed(2)}';
      });
      break;

    default:
      setState(() {
        resultadoCompraComDesconto = 'Desculpe, preencha todos os campos';
      });
  }
}
}



