import 'package:flutter/material.dart';
import 'package:longevity_ai/domain/test/test_parameter.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/screens/main_screen/pages/blood_test_page/widgets/trend_widget.dart';

import 'graph_widget.dart';

class ParameterGraphics extends StatelessWidget {
  const ParameterGraphics({super.key, required this.parameter});

  final TestParameter parameter;

  @override
  Widget build(BuildContext context) {
    final graphName =
        parameter.shortName.isEmpty ? parameter.name : parameter.shortName;
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: GraphWidget(
                graphName: graphName,
                graphType: GraphType.age,
              )),
              50.sbWidth,
              Expanded(
                  child: GraphWidget(
                graphName: graphName,
                graphType: GraphType.people,
              )),
              50.sbWidth
            ],
          ),
        ),
        50.sbHeight,
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TrendWidget(
                  parameter: parameter,
                ),
              ),
              50.sbWidth
            ],
          ),
        ),
      ],
    );
  }
}
