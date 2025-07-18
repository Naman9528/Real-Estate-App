import 'package:flutter/material.dart';

class MyTransactionsPage extends StatelessWidget {
  const MyTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Transactions"),
      ),
      body: const Center(
        child: Text(
          "NO Transactions held!!!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
