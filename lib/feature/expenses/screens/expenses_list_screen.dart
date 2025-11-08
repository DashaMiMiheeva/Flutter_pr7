import 'package:flutter/material.dart';
import '../providers/expenses_provider.dart';
import 'add_expense_screen.dart';
import 'expense_detail_screen.dart';

class ExpensesListScreen extends StatefulWidget {
  const ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  Future<void> _openAddExpense() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = ExpensesProvider.of(context);
    final expenses = provider.expenses;

    return Scaffold(
      appBar: AppBar(title: const Text("Мои расходы")),
      body: expenses.isEmpty
          ? const Center(
        child: Text(
          "Нет расходов",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      )
          : ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final e = expenses[index];
          final date =
              "${e.date.day}.${e.date.month}.${e.date.year}";

          return ListTile(
            title: Text("${e.amount} ₽"),
            subtitle: Text(date),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                provider.delete(e.id);
                setState(() {});
              },
            ),
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
        onPressed: _openAddExpense,
        child: const Icon(Icons.add),
      ),
    );
  }
}
