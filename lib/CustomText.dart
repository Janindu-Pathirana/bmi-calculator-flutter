import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;

  CustomText({@required this.text, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.acme(
        textStyle: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
