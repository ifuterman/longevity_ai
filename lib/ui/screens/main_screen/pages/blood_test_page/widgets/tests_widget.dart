import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:longevity_ai/domain/test/test.dart';
import 'package:longevity_ai/domain/test/test_parameter.dart';
import 'package:longevity_ai/globals.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/screens/main_screen/pages/blood_test_page/widgets/blood_test_widget.dart';
import 'package:longevity_ai/ui/screens/main_screen/pages/blood_test_page/widgets/graph_widget.dart';

class TestsWidget extends ConsumerWidget{
  TestsWidget({super.key, required List<Test> bloodTests}) : controller = TestsWidgetController(bloodTests);
  final TestsWidgetController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50.w),
          width: 480.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.borderElements, width: 2)
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.bloodTests.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BloodTestWidget(test: controller.bloodTests[index], controller: controller,);
                  },
                ),
              ),
            ],
          ),
          // child: Expanded(
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: controller.bloodTests.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return BloodTestWidget(test: controller.bloodTests[index]);
          //     },
          //   ),
          // ),
        ),
        // Container(/////////
        //   child: Column(
        //     children: [
        //       Container(//////////
        //         child: Row(
        //           children: [
        //             GraphWidget(graphName: 'graphName Age'),
        //             GraphWidget(graphName: 'graphName of Similar people'),
        //           ],
        //         )
        //       )
        //     ],
        //   )
        // )
      ],
    );
  }
}

class TestsWidgetController{

  final List<Test> bloodTests;
  final currentParameterProvider = CurrentParameterProvider(
    (ref) => CurrentTestParameterNotifier(null)
  );

  TestsWidgetController(this.bloodTests);

  void parameterSelected(TestParameter parameter){
    appRef.read(currentParameterProvider.notifier).parameterSelected(parameter);
  }

  void parameterUnselected(){
    appRef.read(currentParameterProvider.notifier).notSelected();
  }
}

typedef CurrentParameterProvider = StateNotifierProvider<CurrentTestParameterNotifier, TestParameter?>;

class CurrentTestParameterNotifier extends StateNotifier<TestParameter?>{
  CurrentTestParameterNotifier(super.state);
  void notSelected (){
    state = null;
  }

  void parameterSelected(TestParameter parameter){
    state = parameter;
  }
}
