import 'package:flutter/material.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';

class SideButton extends StatelessWidget {
  const SideButton(
      {super.key, this.onTap, required this.borderColor, this.child});

  final void Function()? onTap;
  final Color borderColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 151.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(10.r),
              bottomStart: Radius.circular(10.r),
            ),
//          borderRadius: BorderRadius.all(Radius.circular(10.r))
          ),
          child: child),
    );
  }
}
