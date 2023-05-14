import 'package:flutter/material.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/common/app_icons.dart';

class ButtonCollapse extends StatelessWidget{
  const ButtonCollapse({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w0,
        height: 32.h0,
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(color: AppColors.borderLeftBar)
        ),
        child: Image.asset(AppIcons.imageCollapse, width: 32.r, height: 32.r,),
      ),
    );
  }

}