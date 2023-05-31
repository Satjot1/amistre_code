import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 89, 24, 255),
      body: Center(
        child: Text(
          error,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
