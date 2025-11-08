import 'package:flutter/material.dart';
import '../../../locator.dart';
import '../models/category_service.dart';
import '../models/expense.dart';
import '../providers/expenses_provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  final categoryService = locator.get<CategoryService>();
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = categoryService.categories.first;
  }

  void _save() {
    if (_selectedCategory == null || _amountController.text.isEmpty) return;

    final amount = double.tryParse(_amountController.text) ?? 0;
    final expense = Expense(
      id: DateTime.now().toString(),
      amount: amount,
      category: _selectedCategory!,
      description: _descriptionController.text.isEmpty
          ? null
          : _descriptionController.text,
      date: DateTime.now(),
      imageUrl: categoryService.images[_selectedCategory]!,
    );

    ExpensesProvider.of(context).add(expense);
    Navigator.pop(context);
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
            const SizedBox(height: 12),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedCategory,
              items: categoryService.categories
                  .map((c) => DropdownMenuItem(
                value: c,
                child: Text(c),
              ))
                  .toList(),
              onChanged: (v) => setState(() => _selectedCategory = v),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Описание"),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _save,
              child: const Text("Сохранить"),
            ),
          ],
        ),
      ),
    );
  }
}
