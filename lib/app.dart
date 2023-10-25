import 'package:flutter/material.dart';

import 'pages/animated_list/animated_list_page.dart';
import 'pages/blur/blur_page.dart';
import 'pages/expansion_tile/expansion_tile_page.dart';
import 'pages/overlay/overlay_page.dart';
import 'pages/page_view/page_view_page.dart';
import 'pages/todo/todo_list_page.dart';

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

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const routeName = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Flutter playground'),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              children: <_Page>[
                _Page(name: 'Todo', route: TodoListPage.route),
                _Page(name: 'PageView', route: PageViewPage.route),
                _Page(name: 'ExpansionTile', route: ExpansionTilePage.route),
                _Page(name: 'AnimatedList', route: AnimatedListPage.route),
                _Page(name: 'Blur', route: BlurPage.route),
                _Page(name: 'Overlay', route: OverlayPage.route),
              ]
                  .map(
                    (page) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(page.route());
                      },
                      child: Card(
                        child: Center(
                          child: Text(
                            page.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class _Page {
  final String name;
  final Route Function() route;

  _Page({required this.name, required this.route});
}
