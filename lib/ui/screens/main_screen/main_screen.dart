import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:longevity_ai/globals.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/common/app_icons.dart';
import 'package:longevity_ai/ui/screens/main_screen/widgets/left_bar.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  final MainScreenController _controller;
  MainScreen({super.key}) : _controller = MainScreenController();

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///We need here stack because in desktop version buttons can't be tapped when they overlap with other elements
      body: Stack(
        children: [
          Row(
            children: [
              LeftBar(controller: widget._controller),
              Expanded(
                child: Container(
                    //                color: Colors.red,
                    ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              118.sbHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///280 - expanded width
                  ///41 - collapsed width
                  ///16 - button radius
                  widget._controller.isLeftBarExpanded
                      ? (280 - 16).sbWidth
                      : (41 - 16).sbWidth,
                  RawMaterialButton(
                    elevation: 0,
                    fillColor: AppColors.backgroundWhite,
                    shape: const CircleBorder(
                        side: BorderSide(color: AppColors.borderLeftBar)),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    constraints: BoxConstraints.loose(Size(32.w, 32.h)),
                    onPressed: changeState,
                    child: Image.asset(
                      widget._controller.isLeftBarExpanded
                          ? AppIcons.imageCollapse
                          : AppIcons.imageExpand,
                      width: 32.r,
                      height: 32.r,
                    ),
                  )
                ],
              ),
              const Spacer()
            ],
          ),
        ],
      ),
    );
  }

  void changeState() {
    setState(() {
      widget._controller.isLeftBarExpanded =
          !widget._controller.isLeftBarExpanded;
    });
  }
}

class MainScreenController {
  bool isLeftBarExpanded = true;
  final selectedItemProvider = SelectedItemNotifierProvider(
      (ref) => SelectedItemNotifier(SelectedLeftBarItem.patientOverview));

  void leftBarItemSelected(SelectedLeftBarItem item) {
    debugPrint('MainScreenController.leftBarItemSelected $item');
    appRef.read(selectedItemProvider.notifier).setSelectedItem(item);
  }
}

typedef SelectedItemNotifierProvider
    = StateNotifierProvider<SelectedItemNotifier, SelectedLeftBarItem>;

class SelectedItemNotifier extends StateNotifier<SelectedLeftBarItem> {
  SelectedItemNotifier(super.state);
  void setSelectedItem(SelectedLeftBarItem item) => state = item;
}
