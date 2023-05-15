import 'package:flutter/material.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/common/app_styles.dart';


class GraphWidget extends StatelessWidget{
  const GraphWidget({super.key, required this.graphName});
  final String graphName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(color: AppColors.borderElements)
      ),
      child: Column(
        children: [
          Container(
            height: 43.h,
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 10.h),
            child: Text(
              graphName,
              style: AppStyles.text14.andWeight(FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

}