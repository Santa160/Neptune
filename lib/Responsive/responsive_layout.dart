import 'package:flutter/widgets.dart';

class ResponsiveLayoutPage extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLargest;
  final Widget? tablet;
  final Widget desktop;
  const ResponsiveLayoutPage({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
    required this.mobileLargest,
  });
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 700;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1046;

  static bool isExtraLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= 1046) {
      return desktop;
    } else if (size.width >= 700 && tablet != null) {
      return tablet!;
    } else if (size.width >= 500 && mobileLargest != null) {
      return mobileLargest!;
    } else {
      return mobile;
    }
  }
}
