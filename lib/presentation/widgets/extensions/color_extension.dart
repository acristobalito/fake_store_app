import 'package:flutter/material.dart';

class ColorExtension {
  static Color? stringToColor(String? colorString) {
    try {
      if (colorString != null && colorString.startsWith("#")) {
        colorString = colorString.replaceFirst("#", "0xff");
        return Color(int.parse(colorString));
      } else {
        throw Exception("Invalid color format");
      }
    } catch (e) {
      return null;
    }
  }
}
