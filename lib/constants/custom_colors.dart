import 'package:flutter/cupertino.dart';

class CustomColors {
  CustomColors._();

  static const Color scaffold = Color(0xff0A0A0A);
  static const Color options = Color(0xff171717);
  static const Color optionsLight = Color(0xff20212c);
  static const Color scaffoldLight = Color(0xff414053);
  static const Color selectionColor = Color(0xffae6ddd);
  static const Color circleColor = Color(0xffae6ddd);
  static const Color lightBlack = Color(0xff1d1d1d);

  /// Button Linear Gradient
  static final Gradient loginButtonColor = LinearGradient(
    colors: [Color(0xffb716dc), Color(0xffd227aa)],
    stops: [.1, .6],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Bottom navigation button color
  static final Gradient navigationButtonColor = LinearGradient(
    colors: [
      Color(0xfffd8890),
      Color(0xfffb72a4),
      Color(0xffc748d3),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}
