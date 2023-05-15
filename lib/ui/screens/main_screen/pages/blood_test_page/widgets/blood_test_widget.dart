import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:longevity_ai/domain/test/test.dart';
import 'package:longevity_ai/globals.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/common/app_icons.dart';
import 'package:longevity_ai/ui/common/app_styles.dart';
import 'package:intl/intl.dart';
import 'package:longevity_ai/ui/screens/main_screen/pages/blood_test_page/widgets/blood_test_parameter_widget.dart';
import 'package:longevity_ai/ui/screens/main_screen/pages/blood_test_page/widgets/tests_widget.dart';

class BloodTestWidget extends StatefulWidget{
  const BloodTestWidget({super.key, required this.test, required this.controller});

  final Test test;
  final TestsWidgetController controller;
  @override
  State<StatefulWidget> createState() {
    return BloodTestWidgetState();
  }

}

class BloodTestWidgetState extends State<BloodTestWidget>{
  BloodTestWidgetState();
  bool _expanded = false;
  final format = DateFormat('MMM dd');
  @override
  Widget build(BuildContext context) {
    final testDate = format.format(widget.test.loggingDate);
    return ExpansionTile(
      onExpansionChanged: expansionChanged,
      tilePadding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 25.w),
      shape: Border.all(color: AppColors.borderElements),
      collapsedShape: Border.all(color: AppColors.borderElements),
      leading: Image.asset(
        AppIcons.imageBloodResults,
        height: 58.r,
        width: 58.r,
      ),
      trailing: Image.asset(_expanded ? AppIcons.imageChevronDown : AppIcons.imageChevronUp, height: 32.h, width: 32.w),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Blood Results',
            style: AppStyles.text20.andWeight(FontWeight.w600),
          ),
          Text(
            'Logging time - $testDate',
            style: AppStyles.text14.andWeight(FontWeight.w400),
          )
        ],
      ),
      children: List<Widget>.generate(
        widget.test.params.length,
        (index) => BloodTestParameterWidget(parameter: widget.test.params[index], controller: widget.controller,)
      ),
    );
  }
  void expansionChanged(bool state){
    setState(() {
      _expanded = state;
    });
    ///We need remove selected item if this item belongs to this test.
    ///We need this to remove the graph part from the screen
    final param = appRef.read(widget.controller.currentParameterProvider);
    if(param == null){
      return;
    }
    for(final p in widget.test.params){
      if(p == param){
        widget.controller.parameterUnselected();
        return;
      }
    }
  }
}