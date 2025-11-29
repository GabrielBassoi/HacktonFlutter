import 'dart:ui';

class Cor {
  static const Color red = Color(0xFFE1251B);
  static const Color black = Color(0xFF262626);
  static const Color gray = Color(0xFF414042);
  static const Color white = Color(0xFFEDEDED);
}

class Sty {
  static final TextStyle header = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Cor.black,
  );

  static TextStyle subheader = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: Cor.gray,
  );

  static TextStyle body = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Cor.black,
  );

  static TextStyle button = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Cor.white,
  );
}