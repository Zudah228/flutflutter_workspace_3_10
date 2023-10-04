import 'package:flutter/material.dart';

import 'pages/main/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF435BF5);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
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
        ),
        cardTheme: CardTheme(
          color: colorScheme.tertiaryContainer,
        ),
      ),
      home: const MainPage(),
    );
  }
}
