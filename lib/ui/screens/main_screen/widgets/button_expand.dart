import 'package:flutter/material.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/common/app_icons.dart';

class ButtonExpand extends StatelessWidget{
  const ButtonExpand({super.key, required this.onTap});

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
        child: Image.asset(AppIcons.imageExpand, width: 32.r, height: 32.r,),
      ),
    );
  }

}