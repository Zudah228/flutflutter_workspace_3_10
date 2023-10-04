import 'package:flutter/material.dart';

class ExpansionTilePage extends StatelessWidget {
  const ExpansionTilePage._();

  static const routeName = '/expansion_tile';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ExpansionTilePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Tile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Column(
          children: [
            ExpansionTile(
              title: const Text('data1'),
              children: ['data2', 'data3']
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ListTile(
                        title: Text(e),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
