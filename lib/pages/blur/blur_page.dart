import 'dart:ui';

import 'package:flutter/material.dart';

class BlurPage extends StatelessWidget {
  const BlurPage._();

  static const routeName = '/blur';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const BlurPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BlurPage'),
      ),
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
          Column(
            children: [
              const SizedBox(height: 64),
              SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, __) => AspectRatio(
                    aspectRatio: 1,
                    child: ColoredBox(color: colorScheme.primary),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 24),
                  itemCount: 10,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
