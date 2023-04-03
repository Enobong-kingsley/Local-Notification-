import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.payload});

  final String payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notification Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          payload,
          style:const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
