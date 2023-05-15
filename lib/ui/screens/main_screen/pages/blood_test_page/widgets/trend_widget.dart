import 'package:flutter/material.dart';
import 'package:longevity_ai/domain/test/test_parameter.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/common/app_icons.dart';
import 'package:longevity_ai/ui/common/app_styles.dart';
import 'package:longevity_ai/ui/screens/main_screen/pages/blood_test_page/widgets/side_button.dart';

class TrendWidget extends StatefulWidget {
  const TrendWidget({super.key, required this.parameter});

  final TestParameter parameter;

  @override
  State<StatefulWidget> createState() {
    return TrendWidgetState();
  }
}

enum SideButtonType {
  button_1,
  button_2,
  button_3,
}

class TrendWidgetState extends State<TrendWidget> {
  SideButtonType currentButton = SideButtonType.button_1;
  @override
  Widget build(BuildContext context) {
    final graphName = widget.parameter.shortName.isEmpty
        ? widget.parameter.name
        : widget.parameter.shortName;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: AppColors.borderElements)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 10.h),
            decoration: const BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(color: AppColors.borderElements))),
            child: Center(
              child: Text(
                '$graphName Trend',
                style: AppStyles.text14.andWeight(FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(AppIcons.imageStubTrend),
                      fit: BoxFit.scaleDown,
                    )),
                  ),
                ),
                Container(
                  width: 163.h,
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                          start: BorderSide(color: AppColors.borderElements))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      12.sbHeight,
                      Row(
                        children: [
                          12.sbWidth,
                          Text(
                            'Top Interventions',
                            style: AppStyles.text14.andWeight(FontWeight.w400),
                          ),
                          const Spacer(),
                        ],
                      ),
                      16.sbHeight,
                      SideButton(
                        borderColor: currentButton == SideButtonType.button_1
                            ? AppColors.sideButtonSelected
                            : AppColors.borderElements,
                        onTap: () => sideButtonTap(SideButtonType.button_1),
                        child: Row(
                          children: [
                            Image.asset(AppIcons.imageArrowDown),
                            10.sbWidth,
                            Text(
                              'Swimming',
                              style: AppStyles.text13
                                  .andWeight(FontWeight.w400)
                                  .andColor(AppColors.textHint),
                            )
                          ],
                        ),
                      ),
                      18.sbHeight,
                      SideButton(
                        borderColor: currentButton == SideButtonType.button_2
                            ? AppColors.sideButtonSelected
                            : AppColors.borderElements,
                        onTap: () => sideButtonTap(SideButtonType.button_2),
                        child: Row(
                          children: [
                            Image.asset(AppIcons.imageArrowDown),
                            10.sbWidth,
                            Text(
                              'Moderate carbs',
                              style: AppStyles.text13
                                  .andWeight(FontWeight.w400)
                                  .andColor(AppColors.textHint),
                            )
                          ],
                        ),
                      ),
                      18.sbHeight,
                      SideButton(
                        borderColor: currentButton == SideButtonType.button_3
                            ? AppColors.sideButtonSelected
                            : AppColors.borderElements,
                        onTap: () => sideButtonTap(SideButtonType.button_3),
                        child: Row(
                          children: [
                            Image.asset(AppIcons.imageArrowDown),
                            10.sbWidth,
                            Text(
                              'Fish X2 a week',
                              style: AppStyles.text13
                                  .andWeight(FontWeight.w400)
                                  .andColor(AppColors.textHint),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void sideButtonTap(SideButtonType button) {
    setState(() {
      currentButton = button;
    });
  }
}
