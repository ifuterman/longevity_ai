import 'package:flutter/material.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/common/app_icons.dart';
import 'package:longevity_ai/ui/common/app_styles.dart';

enum GraphType { age, people }

class GraphWidget extends StatelessWidget {
  const GraphWidget(
      {super.key, required this.graphName, required this.graphType});
  final String graphName;
  final GraphType graphType;
  @override
  Widget build(BuildContext context) {
    String label = graphType == GraphType.age
        ? '$graphName Age'
        : '$graphName of Similar People';
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: AppColors.borderElements)),
      child: Column(
        children: [
          Container(
            height: 43.h,
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 10.h),
            child: Text(
              label,
              style: AppStyles.text14.andWeight(FontWeight.w500),
            ),
          ),
          Image.asset(graphType == GraphType.age
              ? AppIcons.imageStubGraphAge
              : AppIcons.imageStubGraphPeople)
        ],
      ),
    );
  }
}
