import 'package:flutter/material.dart';

import 'example_run.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final model = ExampleRun();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(onPressed: () {}, child: Text('Жми сюда')),
      )),
    );
  }
}
