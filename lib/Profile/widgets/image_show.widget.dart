import 'package:Neptune/Profile/widgets/profile.widget.dart';
import 'package:flutter/material.dart';

class ImageShowWidget extends StatelessWidget {
  const ImageShowWidget({
    Key? key,
    required this.baseUrl,
    required this.widget,
    required this.height,
    this.weight,
  }) : super(key: key);

  final String baseUrl;
  final ProfileWidget widget;
  final double? height;
  final double? weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(baseUrl),
          fit: BoxFit.cover,
        ),
      ),
      height: height,
      width: weight,
    );
  }
}
