import 'package:flutter/material.dart';
import 'demo_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo 集合'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const DemoListScreen(),
    );
  }
}
