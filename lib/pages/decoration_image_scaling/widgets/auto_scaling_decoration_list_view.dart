import 'package:flutter/material.dart';

class AutoScalingDecorationListView extends StatelessWidget {
  const AutoScalingDecorationListView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return ColoredBox(
      color: scaffoldBackgroundColor,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('戻る'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
