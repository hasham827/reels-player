import 'package:assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppShadows {
  BoxShadow kPrimaryShadow = BoxShadow(
    color: AppColors.kPrimaryColor.withOpacity(0.1),
    blurRadius: 10,
    offset: const Offset(5, 5),
  );
}
