import 'package:flutter/material.dart';
import 'package:tempo_brasil/shared/theme_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.weight,
      this.align,
      this.color,
      this.size});

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      style: TextStyle(fontFamily: 'Ubuntu',
          fontSize: size ?? 18,
          color: color ?? lightColorScheme.onPrimary,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}
