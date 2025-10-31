import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseDetailScreen extends StatelessWidget {
  final Expense expense;

  const ExpenseDetailScreen({required this.expense, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = "${expense.date.day}.${expense.date.month}.${expense.date.year}";
    return Scaffold(
      appBar: AppBar(title: const Text("Детали расхода")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(expense.imageUrl, width: 100, height: 100),
            const SizedBox(height: 16),
            Text("Сумма: ${expense.amount} ₽"),
            Text("Дата: $date"),
            Text("Категория: ${expense.category}"),
            Text("Описание: ${expense.description ?? '—'}"),
          ],
        ),
      ),
    );
  }
}
