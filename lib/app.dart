import 'package:flutter/material.dart';

import 'pages/main/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF435BF5);
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
      secondary: Color(0xFF36F5DC),
      onSecondary: Colors.white,
      error: Color(0xFFEB718A),
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Color(0xFFDDE3F9),
      onSurface: Colors.white,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primaryContainer,
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
