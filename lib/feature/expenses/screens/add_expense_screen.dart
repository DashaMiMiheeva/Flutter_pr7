import 'package:flutter/material.dart';
import '../models/expense.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _category = 'Еда';
  final List<String> _categories = [
    'Еда', 'Транспорт', 'Покупки', 'Развлечения', 'Прочее'
  ];
  final Map<String, String> _imgs = {
    'Еда': 'https://cdn-icons-png.flaticon.com/512/1046/1046857.png',
    'Транспорт': 'https://cdn-icons-png.flaticon.com/512/3124/3124296.png',
    'Покупки': 'https://cdn-icons-png.flaticon.com/512/891/891462.png',
    'Развлечения': 'https://cdn-icons-png.flaticon.com/512/3107/3107849.png',
    'Прочее': 'https://cdn-icons-png.flaticon.com/512/2917/2917995.png',
  };
  void _save() {
    final amount = double.parse(_amountController.text);
    final expense = Expense(
      id: DateTime.now().toString(),
      amount: amount,
      category: _category,
      description: _descriptionController.text.isEmpty
          ? null
          : _descriptionController.text,
      date: DateTime.now(),
      imageUrl: _imgs[_category]!,
    );
    Navigator.pop(context, expense);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Добавить расход")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: "Сумма"),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: _category,
              items: _categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => setState(() => _category = v!),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Описание"),
            ),
            const Spacer(),
            ElevatedButton(onPressed: _save, child: const Text("Сохранить")),
          ],
        ),
      ),
    );
  }
}
