import 'package:flutter/material.dart';
import 'package:flutter_workspace_3_10/pages/decoration_image_scaling/widgets/auto_scaling_decoration_list_view.dart';
import 'package:flutter_workspace_3_10/pages/decoration_image_scaling/widgets/clip_rect_vertical.dart';

class DecorationImageScalingPage extends StatelessWidget {
  const DecorationImageScalingPage._();

  static const routeName = '/decoration_image_scaling';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const DecorationImageScalingPage._(),
    );
  }

  static const _image = AssetImage('assets/images/4_5MB.jpeg');

  static const _decoration = BoxDecoration(
    image: DecorationImage(
      image: _image,
      fit: BoxFit.cover,
    ),
  );

  static const _height = 200.0;
  static const _additionalHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DecorationImageScaling'),
      ),
      body: Navigator(
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (nestedNavigatorContext) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: () {
                          Navigator.of(nestedNavigatorContext).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  const AutoScalingDecorationListView(),
                            ),
                          );
                        },
                        child: const Text('活用例'),
                      ),
                      const SizedBox(height: 24),
                      const _Title('通常のサイズ'),
                      _SizeGuild(
                        child: Container(
                          height: _height,
                          width: _height,
                          decoration: _decoration,
                          child: const _InnerContents(),
                        ),
                      ),
                      const _Title(
                        '拡大サイズ（Stack）',
                        caption: '拡大した分、ウィジェットが大きくなってしまっている',
                      ),
                      const _SizeGuild(
                        child: SizedBox.square(
                          dimension: _height + _additionalHeight,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image(
                                image: _image,
                                fit: BoxFit.cover,
                              ),
                              Center(child: _InnerContents())
                            ],
                          ),
                        ),
                      ),
                      const _Title(
                        '拡大サイズ',
                        caption: '背景画像が拡大され、表示したいサイズ以外は切り取られている',
                      ),
                      _SizeGuild(
                        child: ClipRectVertical(
                          vertical: _additionalHeight,
                          child: Container(
                            height: _height + _additionalHeight,
                            width: _height,
                            decoration: _decoration,
                            child: const _InnerContents(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.text, {this.caption});

  final String text;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ColoredBox(
      color: colorScheme.primaryContainer,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  fontSize: 18,
                ),
              ),
              if (caption != null)
                Text(
                  caption!,
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.1,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InnerContents extends StatelessWidget {
  const _InnerContents();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.center,
      child: Container(
        color: colorScheme.tertiary,
        padding: const EdgeInsets.all(8),
        child: const Icon(Icons.park_outlined),
      ),
    );
  }
}

class _SizeGuild extends StatelessWidget {
  const _SizeGuild({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 300,
      child: Stack(
        children: [
          Center(child: child),
          _buildBorder(
            size: 200,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildBorder({
    required double size,
    required Color color,
  }) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: color),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              ' ${size.toInt()}x${size.toInt()}',
              style: TextStyle(backgroundColor: color),
            ),
          ),
        ),
      ),
    );
  }
}
