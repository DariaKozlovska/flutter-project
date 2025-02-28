import 'dart:ui';

class MyColors {
  static final blackColor = HexColor('OEOEOE');
  static final whiteColor = HexColor('FFFFFF');
  static final lightPurpleColor = HexColor('BB84E8');
  static final darkPurpleColor = HexColor('471AA0');
  static final redColor = HexColor('FF0000');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}