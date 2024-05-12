import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
class CustomTextButton extends StatefulWidget {
  VoidCallback? onTap;
  String? buttonText;
  CustomTextButton({super.key,required this.onTap,required this.buttonText});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 40,
        width: 150,
        padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        decoration: BoxDecoration(
          gradient: AppColors.kButtonGradient,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Text(widget.buttonText.toString(),style: urbanistMedium.copyWith(
            color: AppColors.kWhiteColor,
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),),
        ),
      ),
    );
  }
}
