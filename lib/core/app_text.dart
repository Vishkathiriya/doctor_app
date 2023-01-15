import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontsize;
  final FontWeight fontWeight;
  final double? wordspace;
  final bool textCenter;
  final dynamic foreground;
  final double? laterspacing;

  final TextDecoration? decoration;

  const AppText({
    Key? key,
    required this.text,
    this.color,
    required this.fontsize,
    required this.fontWeight,
    this.wordspace,
    this.laterspacing,
    this.decoration,
    this.foreground,
    this.textCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      textAlign: textCenter ? TextAlign.center : null,
      style: GoogleFonts.montserrat(
        letterSpacing: laterspacing,
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
        wordSpacing: wordspace,
        decoration: decoration,
        foreground: foreground,
        // forground: Paint()
        // ..shader = const LinearGradient(
        //   colors: <Color>[
        //     AppColor.gradient1,
        //     AppColor.gradient2,
        //   ],
        // ).createShader(Rect.fromLTWH(0.0, 0.0, 93.0, 96.0))
      ),
    );
  }
}
