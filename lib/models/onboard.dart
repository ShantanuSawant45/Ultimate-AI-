import 'package:flutter/foundation.dart'; // Required for @immutable

@immutable
class Onboard {
  final String title;
  final String subtitle;
  final String lottie;

  const Onboard({
    required this.title,
    required this.subtitle,
    required this.lottie,
  });
}
