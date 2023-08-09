import 'package:flutter/material.dart';

import 'pages/todo_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: colorScheme,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: colorScheme.primary,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            border: InputBorder.none,
          ),
          listTileTheme: ListTileThemeData(
            tileColor: colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          )),
      home: const TodoListPage(),
    );
  }
}
