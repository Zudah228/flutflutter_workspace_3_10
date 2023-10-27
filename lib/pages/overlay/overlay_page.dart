import 'dart:async';

import 'package:flutter/material.dart';

class OverlayPage extends StatefulWidget {
  const OverlayPage._();

  static const routeName = '/overlay';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OverlayPage._(),
    );
  }

  @override
  State<OverlayPage> createState() => _OverlayPageState();
}

class _OverlayPageState extends State<OverlayPage> {
  final _overlayKey = GlobalKey<OverlayState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OverlayPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                final entries = <OverlayEntry>[];

                Timer.periodic(const Duration(seconds: 1), (timer) {
                  if (timer.tick == 10) {
                    for (var element in entries) {
                      element.remove();
                    }
                    timer.cancel();
                    return;
                  }

                  final entry = OverlayEntry(
                    builder: (context) {
                      final size = 200.0 - (10 * timer.tick);

                      return Align(
                        child: Container(
                          color: timer.tick % 2 == 0 ? Colors.blue : Colors.red,
                          height: size,
                          width: size,
                        ),
                      );
                    },
                  );
                  _overlayKey.currentState?.insert(entry);
                  entries.add(entry);
                });
              },
              child: const Text(
                '時間差オーバーレイ',
              ),
            ),
            const SizedBox(height: 32),
            const Text('部分的オーバーレイ領域'),
            const SizedBox(height: 8),
            SizedBox.square(
              dimension: 200,
              child: ColoredBox(
                color: Colors.black12,
                child: Overlay(
                  key: _overlayKey,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
