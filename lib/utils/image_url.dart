import 'dart:math';

class ImageUrl {
  const ImageUrl._();

  static String random() {
    return allList[Random().nextInt(allList.length -1)];
  }

  static List<String> get allList => [
    monster,
    blueGiant,
    conan,
    gridMan,
    tokyoMer,
    sandLand,
    psychoPath,
    kmd,
    kingdom,
    shinChan,
    spyFamily,
    analog,
  ];

  static String get monster =>
      'https://www.toho.co.jp/images/5ddb2c10458f149fafd216eb5697b9f625c0cf3ff4b7d47e257c9fd36f56ef0a';
  static String get blueGiant =>
      'https://www.toho.co.jp/images/b038b1b3e17fd2bbbcc0dd5b2c5867d11a1e1ece78be21992e242e1b273ce2dc';
  static String get conan =>
      'https://www.toho.co.jp/images/2d1474c9b121e20c413ff0f34572620645ae4bac41eb91e381e7d3b1ddcb06b7';
  static String get gridMan =>
      'https://www.toho.co.jp/images/2d1474c9b121e20c413ff0f34572620645ae4bac41eb91e381e7d3b1ddcb06b7';
  static String get tokyoMer =>
      'https://www.toho.co.jp/images/1488892a155a4cb56dcf66e598c5de3d9fb2ad5aa32658e1552af2ae4c353ef8';
  static String get sandLand =>
      'https://www.toho.co.jp/images/a41fe1c66550f777ed9176ea0da8965768ba91f086e9b026f44d74e6ea9d020d';
  static String get psychoPath =>
      'https://www.toho.co.jp/images/bbb058a3a09b6e6564125f2ba45c090512cec996ac6ddeaf6478af8adccf19f8';
  static String get kmd =>
      'https://www.toho.co.jp/images/f4602ad1a6d3d01086b3920b62e11bf768f11a0cb0794fd3d47cfc7f0a900817';
  static String get kingdom =>
      'https://www.toho.co.jp/images/c2f747d78399dc968c82c1a88a22cd6a1826243fc2c24156bee94a06a2a26793';
  static String get shinChan =>
      'https://www.toho.co.jp/images/bbab5a0b5dec85f252701b9f32db663f4d3a89707677ed53556c750a51d54996';
  static String get spyFamily =>
      'https://www.toho.co.jp/images/7a38a6e5d35c380e4b671912442183daeee5420b0b21f880565fb900a051e932';
  static String get analog =>
      'https://www.toho.co.jp/images/896f9f1be95cbbcb35a567365d13c180a854aff36691bccea5b11d0f29b05aba';
}
