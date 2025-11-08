import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpensesProvider extends InheritedWidget {
  final List<Expense> _expenses = [];

  ExpensesProvider({required super.child});

  static ExpensesProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExpensesProvider>()!;
  }

  List<Expense> get expenses => List.unmodifiable(_expenses);

  void add(Expense expense) {
    _expenses.insert(0, expense);
  }

  void delete(String id) {
    _expenses.removeWhere((e) => e.id == id);
  }

  @override
  bool updateShouldNotify(_) => true;
}
