import 'package:flutter/material.dart';

class MyTransactionsPage extends StatelessWidget {
  const MyTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("My Transactions",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        ),
      body: Stack(
          children: [
            Text(
                'NO Transaction held!!!',
              style: TextStyle(fontSize: 20),
            ),
      // Background image
      Container(
      decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/back.jpg'),
      fit: BoxFit.cover,
    ),
    ),
    ),
    ]
      ),
    );
  }
}
