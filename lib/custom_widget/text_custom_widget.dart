import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForText extends StatelessWidget {
  final String name;
  final double? size;
  final bool? bold;
  final Color? color;
  const ForText({
    Key? key,
    required this.name,
    this.size,
    this.bold,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.roboto(
        color: color ?? Colors.black,
        fontSize: size ?? 18,
        fontWeight: bold == true ? FontWeight.w800 : FontWeight.w400,
      ),
    );
  }
}
