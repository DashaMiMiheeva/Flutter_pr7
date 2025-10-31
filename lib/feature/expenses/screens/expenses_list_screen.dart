import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'add_expense_screen.dart';
import 'expense_detail_screen.dart';

class ExpensesListScreen extends StatefulWidget {
  const ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  final List<Expense> _expenses = [];

  void _addExpense() async {
    final newExpense = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddExpenseScreen()),
    );

    if (newExpense != null && newExpense is Expense) {
      setState(() => _expenses.insert(0, newExpense));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Мои расходы")),
      body: ListView.builder(
        itemCount: _expenses.length,
        itemBuilder: (context, index) {
          final e = _expenses[index];
          final date = "${e.date.day}.${e.date.month}.${e.date.year}";
          return ListTile(
            title: Text("${e.amount} ₽"),
            subtitle: Text(date),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExpenseDetailScreen(expense: e),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExpense,
        child: const Icon(Icons.add),
      ),
    );
  }
}
