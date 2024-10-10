import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const LoanCalculatorApp());
}

class LoanCalculatorApp extends StatelessWidget {
  const LoanCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loan Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoanCalculatorScreen(),
    );
  }
}

class LoanCalculatorScreen extends StatefulWidget {
  const LoanCalculatorScreen({super.key});

  @override
  _LoanCalculatorScreenState createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  double _months = 12; // Default to 12 months
  String _monthlyPayment = '';

  // Function to calculate the loan payment
  void _calculatePayment() {
    final double principal = double.tryParse(_amountController.text) ?? 0;
    final double interestRate =
        (double.tryParse(_interestController.text) ?? 0) / 100;
    final double months = _months;

    if (principal > 0 && interestRate > 0 && months > 0) {
      // Formula: M = P * (r(1 + r)^n) / ((1 + r)^n - 1)
      final double monthlyRate = interestRate / 12;
      final double denominator = math.pow(1 + monthlyRate, months) - 1;
      final double monthlyPayment = principal *
          monthlyRate *
          math.pow(1 + monthlyRate, months) /
          denominator;

      setState(() {
        _monthlyPayment = "${monthlyPayment.toStringAsFixed(2)}€";
      });
    } else {
      setState(() {
        _monthlyPayment = "0.00€";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Loan Calculator',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter amount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter number of months',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _months,
              min: 1,
              max: 60,
              divisions: 59,
              activeColor: const Color(0xFF1427C5),
              label: "${_months.toStringAsFixed(0)} months",
              onChanged: (double value) {
                setState(() {
                  _months = value;
                });
              },
            ),
            // Slider with labels
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text('1'),
                    Text('60'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter % per month',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _interestController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Percent',
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, 
                  width: 1.0, 
                ),
                borderRadius:
                    BorderRadius.circular(20.0), 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container for the text
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(105, 223, 223, 223),
                      borderRadius: BorderRadius.circular(
                          20.0), 
                    ),
                    child: const Text(
                      'You will pay the approximate amount monthly:',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Container for the price
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      _monthlyPayment.isNotEmpty ? _monthlyPayment : '0.00€',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1427C5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _calculatePayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1427C5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), 
                  ),
                ),
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
