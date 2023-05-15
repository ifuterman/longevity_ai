import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:longevity_ai/domain/test/test_parameter.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/common/app_styles.dart';
import 'package:longevity_ai/ui/screens/main_screen/pages/blood_test_page/widgets/tests_widget.dart';

class BloodTestParameterWidget extends ConsumerWidget{
  const BloodTestParameterWidget({super.key, required this.parameter, required this.controller});

  final TestParameter parameter;
  final TestsWidgetController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedParam = ref.watch(controller.currentParameterProvider);
    return GestureDetector(
      onTap: () => controller.parameterSelected(parameter),
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 24.h, bottom: 16.h),
        decoration: BoxDecoration(
          color: selectedParam == parameter ? AppColors.backgroundMenu : AppColors.backgroundWhite,
          border: Border.all(color: AppColors.borderElements)
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${parameter.name} (${parameter.shortName})',
                  style: AppStyles.text14.andWeight(FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  '${parameter.currentValue} ${parameter.units}',
                  style: AppStyles.text14.andWeight(FontWeight.w400).andColor(AppColors.textHint),
                ),
                8.sbWidth,
                Icon(
                  parameter.trendDirection == TrendDirection.up ? Icons.trending_up : Icons.trending_down,
                  size: 15.r,
                ),
              ],
            ),
            15.sbHeight,
            Container(
              height: 34,
              width: 430.w,
              child: Stack(
                children: [
                  Container(
                    width: 430.w,
                    height: 6.h,
                    margin: EdgeInsets.only(top: 4.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(71.r)
                    ),
                    child: ScaleWidget(
                      width: 422.w,
                      parameter: parameter,
                    ),
                  ),
                  Row(
                    children: [
                      75.sbWidth,
                      ScaleValueWidget(value: parameter.minValue),
                      const Spacer(),
                      ScaleValueWidget(value: parameter.maxValue),
                      75.sbWidth
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScaleValueWidget extends StatelessWidget{
  const ScaleValueWidget({super.key, required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 16.h,
          width: 2.h,
          color: value == 0 ? Colors.transparent : AppColors.backgroundBlack,
        ),
        Text(
          '$value',
          style: AppStyles.text11.andWeight(FontWeight.w400).andColor(value == 0 ? Colors.transparent : AppColors.textHint),
        )
      ],
    );
  }
}

class ScaleWidget extends StatelessWidget{
  const ScaleWidget({super.key, required this.parameter, required this.width});
  final TestParameter parameter;
  final double width;
  @override
  Widget build(BuildContext context) {
    ///We need to calculate scale factor
    final x = parameter.maxValue / 0.8;
    final scale = width / x;
    final leftWidth = parameter.currentValue * scale;
    final rigthWidth = width - leftWidth;
    Color color = AppColors.scaleGreenColor;
    if(parameter.currentValue > parameter.maxValue || parameter.currentValue < parameter.minValue){
      color = AppColors.scaleYellowColor;
    }
    if(leftWidth == width){
      return Container(
        height: 6.h,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(71.r),
        ),
      );
    }
    return Row(
      children: [
        Container(
          width: leftWidth,
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(71.r),
              bottomStart: Radius.circular(71.r),
            ),
            color: color,
          ),
        ),
        Container(
          width: rigthWidth,
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(71.r),
              bottomEnd: Radius.circular(71.r),
            ),
            color: color.withOpacity(0.2),
          ),
        ),
      ],
    );
    return Container(
      height: 6.h,
      width: width,
      decoration: BoxDecoration(
//        color: color.withOpacity(0.2),
          color: Colors.red
//        borderRadius: BorderRadius.circular(71.r),
      ),
      child: SizedBox(
        height: 6.h,
        width: 20,
        child: Container(
//          color: Colors.black,
        ),
      ),
    );
  }

}