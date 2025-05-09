import 'dart:ui';

class FontVariations extends FontVariation {
  FontVariations._(super.axis, super.value);

  static List<FontVariations> get w600 => [FontVariations._("wght", 600)];
  static List<FontVariations> get w500 => [FontVariations._("wght", 500)];
  static List<FontVariations> get w700 => [FontVariations._("wght", 700)];
  static List<FontVariations> get w800 => [FontVariations._("wght", 800)];
  static List<FontVariations> get w400 => [FontVariations._("wght", 400)];
  static List<FontVariations> get w300 => [FontVariations._("wght", 300)];
}