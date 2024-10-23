import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int sum = 0;
  TextEditingController firstAddController = TextEditingController();
  TextEditingController secondAddController = TextEditingController();

  void calculateSum() {
    setState(() {
      int firstAddNum = int.tryParse(firstAddController.text) ?? 0;
      int secondAddNum = int.tryParse(secondAddController.text) ?? 0;
      sum = firstAddNum + secondAddNum;
    });
  }

  void calculateDifference() {
    setState(() {
      int firstNum = int.tryParse(firstAddController.text) ?? 0;
      int secondNum = int.tryParse(secondAddController.text) ?? 0;
      sum = firstNum - secondNum;
    });
  }

  void calculateProduct() {
    setState(() {
      int firstNum = int.tryParse(firstAddController.text) ?? 0;
      int secondNum = int.tryParse(secondAddController.text) ?? 0;
      sum = firstNum * secondNum;
    });
  }

  void calculateQuotient() {
    setState(() {
      int firstNum = int.tryParse(firstAddController.text) ?? 0;
      int secondNum = int.tryParse(secondAddController.text) ?? 1;
      sum = firstNum ~/ secondNum;
    });
  }

  void clearInputs() {
    setState(() {
      firstAddController.clear();
      secondAddController.clear();
      sum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildRow(
            firstAddController,
            secondAddController,
            ' + ',
            calculateSum,
          ),
          buildRow(
            firstAddController,
            secondAddController,
            ' - ',
            calculateDifference,
          ),
          buildRow(
            firstAddController,
            secondAddController,
            ' × ',
            calculateProduct,
          ),
          buildRow(
            firstAddController,
            secondAddController,
            ' ÷ ',
            calculateQuotient,
          ),
          ElevatedButton(
            onPressed: clearInputs,
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }

  Widget buildRow(
      TextEditingController firstController,
      TextEditingController secondController,
      String operator,
      Function onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TextField(
            controller: firstController,
            decoration: InputDecoration(labelText: "First Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        Text(operator),
        Expanded(
          child: TextField(
            controller: secondController,
            decoration: InputDecoration(labelText: "Second Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        Text(' = $sum'),
        IconButton(
          icon: const Icon(Icons.calculate),
          onPressed: () => onPressed(),
        ),
      ],
    );
  }
}
