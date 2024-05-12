import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/constants/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_text_styles.dart';

class CustomBottomNavBar extends StatefulWidget {
  final List bottomIcons;
  final ValueChanged<int> onTap;
  final int currentIndex;

  CustomBottomNavBar(
      {super.key,
      required this.bottomIcons,
      required this.onTap,
      required this.currentIndex,
     });

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: height(context) * 0.09,
      color: AppColors.kSecondaryColor,
      elevation: 0,
      padding:  EdgeInsets.symmetric(horizontal: width(context)*0.032),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.bottomIcons.length, (index) {
          return GestureDetector(
            onTap: () {
              widget.onTap(index);
            },
            child: widget.bottomIcons[index]['title']==""?
            Container(
              width: 68,
              height: 40,
              decoration:  BoxDecoration(
                gradient: AppColors.kButtonGradient,
                borderRadius: BorderRadius.circular(10)
              ),
              child:Center(
                child: Image.asset(widget.bottomIcons[index]['icon'],
                  color: AppColors.kBlackColor,
                  width: 14,
                  height: 14,),
              ) ,
            ):
            SizedBox(
              width: 55,
              height: 38,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.currentIndex == index
                      ? ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return AppColors.kButtonGradient.createShader(bounds);
                          },
                          child: Image.asset(
                            widget.bottomIcons[index]['icon'],
                            color: Colors.white,
                            width: 24,
                            height: 24,
                          ),
                        )
                      : Image.asset(widget.bottomIcons[index]['icon'],
                          color: AppColors.kUnselectedColor,
                    width: 24,
                    height: 24,),
                  const SizedBox(height: 2),
                  Text(
                    widget.bottomIcons[index]['title'],
                    // Replace 'Label $index' with your desired text
                    style: urbanistBold.copyWith(
                      fontSize: 10,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                      color: widget.currentIndex == index
                          ? AppColors.kPrimaryColor
                          : AppColors.kUnselectedColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
