import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimaryColor = Color(0xff3CFEDE);
  static const Color kSecondaryColor = Color(0xff12305B);
  static const Color kWhiteColor = Color(0xffFFFFFF);
  static const Color kBlackColor = Color(0xff000000);
  static const Color kUnselectedColor = Color(0xffA0ACBD);
  /// button gradient
  static const  LinearGradient kButtonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF3263B0),
      Color(0xFF3CFEDE),
    ],
  );
  static const  LinearGradient kDotGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [
      Color(0XFFF7631D),
      Color(0XFFF9B527),

    ],
  );

}
