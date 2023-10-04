import 'package:flutter/material.dart';
import 'package:flutter_workspace_3_10/pages/animated_list/animated_list_page.dart';
import 'package:flutter_workspace_3_10/pages/page_view/page_view_page.dart';
import 'package:flutter_workspace_3_10/pages/todo/todo_list_page.dart';

import '../expansion_tile/expansion_tile_page.dart';

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
