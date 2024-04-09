import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColors {

  static const Color white = Color(0xffffffff);

  static const Color black = Color(0xff000000);

}

abstract class BC {

  static Color get white => ThemeColors.white;

  static Color get black => ThemeColors.black;
}

abstract class BS {
  static TextStyle get bold24 => GoogleFonts.roboto(
    textStyle: TextStyle(
        color: BC.white,
        fontSize: 24,
        fontWeight: FontWeight.w700)
  );

  static TextStyle get light16 => GoogleFonts.roboto(
      textStyle: TextStyle(
          color: BC.white,
          fontSize: 16,
          fontWeight: FontWeight.w400)
  );
}

abstract class BDuration {
  static Duration get d200 => const Duration(milliseconds: 200);
}

abstract class BRadius {
  static BorderRadius get r16 => const BorderRadius.all(Radius.circular(16));
}

abstract class BShadow {
  static List<BoxShadow> get light => [
        BoxShadow(
            color: BC.white.withOpacity(0.5),
            blurRadius: 60,
            offset: const Offset(0, 2))
      ];
}
