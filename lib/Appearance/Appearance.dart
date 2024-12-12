import 'dart:ui';

class Appearance {
  // Private constructor to prevent instantiation
  Appearance._privateConstructor();

  // The single instance of the class
  static final Appearance _instance = Appearance._privateConstructor();

  // Getter for the instance
  factory Appearance() {
    return _instance;
  }

  final Color primaryColor = const Color(0xFFFFDAB9);
  final Color borderColor = const Color(0xFF1976D2);
  final Color loading = const Color(0xFF1976D2);
}