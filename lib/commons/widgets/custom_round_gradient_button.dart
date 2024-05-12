import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/constants/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class RoundGradientButton extends StatefulWidget {
  VoidCallback? onTap;
  String iconPath;
  String buttonText;
  var centerFill;

  RoundGradientButton(
      {super.key,
      required this.buttonText,
      required this.onTap, this.centerFill,
      required this.iconPath});

  @override
  State<RoundGradientButton> createState() => _RoundGradientButtonState();
}

class _RoundGradientButtonState extends State<RoundGradientButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          padding:const EdgeInsets.all(1),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            border: GradientBoxBorder(
              gradient: AppColors.kButtonGradient,
              width: 2,
            ),
          ),
          child:widget.buttonText=="Notification"?Container(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Center(
                    child: Image.asset(
                      widget.iconPath.toString(),
                      height: 24,
                      width: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 10,
                  child: Center(
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration:const  BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.kDotGradient
                      ),
                    ),
                  ),
                )
              ],
            ),
          ):
          Center(
            child:widget.centerFill? Image.asset(
              widget.iconPath.toString(),
            ): Image.asset(
              widget.iconPath.toString(),
              height: 20,
              width: 20,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 7.9,
        ),
        Text(
          widget.buttonText.toString(),
          style: urbanistMedium.copyWith(
              color: AppColors.kWhiteColor,
              fontSize: 12,
              height: 1.4,
              letterSpacing: 0.2),
        )
      ],
    );
  }
}
