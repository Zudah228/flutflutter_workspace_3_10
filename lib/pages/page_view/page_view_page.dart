import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

const double kPosterStandardAspectRatio = 1 / 1.414;

class PageViewPage extends StatefulWidget {
  const PageViewPage._();

  static const routeName = '/page_view';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const PageViewPage._(),
    );
  }

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageView')),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 64,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 420,
              child: CarouselSlider.builder(
                itemCount: _PageItem.items.length,
                itemBuilder: (context, index, _) => _PageItem.itemBuilder(
                  context,
                  index,
                  _currentIndex,
                ),
                options: CarouselOptions(
                  viewportFraction: 0.7,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.6,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PageItem {
  final Color color;
  final String title;
  final String url;

  _PageItem({
    required this.color,
    required this.title,
    required this.url,
  });

  static List<_PageItem> get items => <_PageItem>[
        _PageItem(
            color: Colors.red,
            title: 'あか',
            url:
                'https://www.toho.co.jp/images/7a38a6e5d35c380e4b671912442183daeee5420b0b21f880565fb900a051e932'),
        _PageItem(
            color: Colors.blue,
            title: 'あお',
            url:
                'https://www.toho.co.jp/images/b513f51ed672b9c74dd743645a90d9e498d43d7c7d08248bad018165bab3da53'),
        _PageItem(
            color: Colors.yellow,
            title: 'き',
            url:
                'https://www.toho.co.jp/images/f4602ad1a6d3d01086b3920b62e11bf768f11a0cb0794fd3d47cfc7f0a900817'),
      ];

  static Widget Function(BuildContext context, int, int) get itemBuilder =>
      (context, index, int selected) {
        final item = _PageItem.items[index];
        final isSelected = selected == index;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                  aspectRatio: kPosterStandardAspectRatio,
                  child: Image.network(item.url)),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: double.infinity,
                  height: isSelected ? 50 : 0,
                  color: Colors.blueGrey,
                  child: Text(item.title),
                ),
              )
            ],
          ),
        );
      };
}
