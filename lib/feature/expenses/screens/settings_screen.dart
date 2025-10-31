import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Настройки")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Text("Профиль"),
            SizedBox(height: 12),
            Text("Уведомления"),
            SizedBox(height: 12),
            Text("Выход"),
          ],
        ),
      ),
    );
  }
}
