import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Главная")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/list'),
              child: const Text("Список расходов"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/settings'),
              child: const Text("Настройки"),
            ),
          ],
        ),
      ),
    );
  }
}
