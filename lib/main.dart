import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'feature/expenses/screens/home_screen.dart';
import 'feature/expenses/screens/expenses_list_screen.dart';
import 'feature/expenses/screens/settings_screen.dart';

void main() {
  runApp(const ExpensesApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/list',
      builder: (context, state) => const ExpensesListScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Учёт расходов',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
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
    );
  }
}
