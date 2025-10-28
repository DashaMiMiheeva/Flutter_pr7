import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главная')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/list'), // маршрутизированно
              child: const Text('Список расходов (GoRouter)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
              ), // страничная навигация push
              child: const Text('Добавить расход (Navigator.push)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              ), // горизонтальная навигация — pushReplacement
              child: const Text('Перейти в настройки (pushReplacement)'),
            ),
            // ... здесь можно добавить краткую статистику
          ],
        ),
      ),
    );
  }
}
