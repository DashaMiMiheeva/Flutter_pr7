import 'package:flutter/material.dart';
import 'feature/expenses/expenses_container.dart';
import 'package:go_router/go_router.dart';
import 'feature/expenses/models/expense.dart';
import 'feature/expenses/screens/home_screen.dart';
import 'feature/expenses/screens/expenses_list_screen.dart';
import 'feature/expenses/screens/add_expense_screen.dart';
import 'feature/expenses/screens/expense_detail_screen.dart';
import 'feature/expenses/screens/settings_screen.dart';

void main() {
  runApp(const ExpensesApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/list',
      name: 'list',
      builder: (context, state) => const ExpensesListScreen(),
    ),
    GoRoute(
      path: '/add',
      name: 'add',
      builder: (context, state) => const AddExpenseScreen(),
    ),
    GoRoute(
      path: '/detail',
      name: 'detail',
      // ожидаем, что при маршрутизируемом переходе можно передать id в параметрах/state.extra
      builder: (context, state) {
        final expense = state.extra as Expense?;
        return ExpenseDetailScreen(expense: expense);
      },
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Учёт расходов',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFC1CC),
        scaffoldBackgroundColor: const Color(0xFFFFF0F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFC1CC),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFFC1CC),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFC1CC),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFFFC1CC),
          secondary: Color(0xFFFFE4E9),
        ),
        useMaterial3: false,
      ),
      home: const ExpensesContainer(),
    );
  }
}
