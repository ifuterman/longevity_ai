import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/common/app_icons.dart';
import 'package:longevity_ai/ui/common/app_styles.dart';
import 'package:longevity_ai/ui/screens/main_screen/main_screen.dart';
import 'package:longevity_ai/ui/screens/main_screen/widgets/collapsed_item.dart';
import 'package:longevity_ai/ui/screens/main_screen/widgets/sub_menu_item.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({super.key, required MainScreenController controller})
      : _controller = controller;

  final MainScreenController _controller;

  @override
  Widget build(BuildContext context) {
    return _controller.isLeftBarExpanded
        ? _LeftBarExpanded(controller: _controller)
        : _LeftBarCollapsed();
  }
}

class _LeftBarCollapsed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41.w,
      decoration: const BoxDecoration(
          color: AppColors.backgroundLeftBar,
          border: Border(right: BorderSide(color: AppColors.borderLeftBar))),
    );
  }
}

class _LeftBarExpanded extends ConsumerWidget {
  final MainScreenController controller;
  const _LeftBarExpanded({required this.controller});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentItem = ref.watch(controller.selectedItemProvider);
    final selectedDec = BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.all(Radius.circular(10.r)));
    return Container(
      padding: EdgeInsets.only(top: 45.h, left: 25.w, right: 25.w),
      width: 280.w,
      decoration: const BoxDecoration(
          color: AppColors.backgroundLeftBar,
          border: Border(right: BorderSide(color: AppColors.borderLeftBar))),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Image.asset(
                  AppIcons.logo,
                  height: 54.h,
                  width: 53.w,
                ),
                15.sbWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LongevityAI',
                      style: AppStyles.text24
                          .andWeight(FontWeight.w600)
                          .andColor(AppColors.textDarkGreen),
                    ),
                    Text(
                      'Dashboard',
                      style: AppStyles.text16
                          .andWeight(FontWeight.w300)
                          .andColor(AppColors.textLightGreen),
                    ),
                  ],
                )
              ],
            ),
          ),
          60.sbHeight,
          Container(
            height: 1,
            width: 231.w,
            color: AppColors.borderLeftBar,
          ),
          20.sbHeight,
          SizedBox(
              width: 231.w,
//            height: MediaQuery.of(context).size.height - 186.h,
              child: ListView(
                shrinkWrap: true,
                children: [
                  CollapsedItem(
                    title: 'Patient',
                    titleStyle: AppStyles.text16
                        .andWeight(FontWeight.w300)
                        .andColor(AppColors.textDarkGreen),
                    children: [
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            decoration: currentItem ==
                                    SelectedLeftBarItem.patientOverview
                                ? selectedDec
                                : null,
                            child: ListTile(
                              onTap: () => controller.leftBarItemSelected(
                                  SelectedLeftBarItem.patientOverview),
                              title: Row(
                                children: [
                                  Image.asset(
                                    AppIcons.imageFolder,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  10.sbWidth,
                                  Text(
                                    'Overview',
                                    style: AppStyles.text18
                                        .andWeight(FontWeight.w400)
                                        .andColor(AppColors.textDarkGreen),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration:
                                currentItem == SelectedLeftBarItem.patientAbout
                                    ? selectedDec
                                    : null,
                            child: ListTile(
                              onTap: () => controller.leftBarItemSelected(
                                  SelectedLeftBarItem.patientAbout),
                              title: Row(
                                children: [
                                  Image.asset(
                                    AppIcons.imagePerson,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  10.sbWidth,
                                  Text(
                                    'About',
                                    style: AppStyles.text18
                                        .andWeight(FontWeight.w400)
                                        .andColor(AppColors.textDarkGreen),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SubMenuItem(
                            onTap: () => controller.leftBarItemSelected(
                                SelectedLeftBarItem.patientBiomarkers),
                            selectedItemProvider:
                                controller.selectedItemProvider,
                            title: Row(
                              children: [
                                Image.asset(
                                  AppIcons.imageBio,
                                  width: 28.w,
                                  height: 28.h,
                                ),
                                10.sbWidth,
                                Text(
                                  'Biomarkers',
                                  style: AppStyles.text18
                                      .andWeight(FontWeight.w400)
                                      .andColor(AppColors.textDarkGreen),
                                )
                              ],
                            ),
                            itemType: SelectedLeftBarItem.patientBiomarkers,
                            items: [
                              SubItem(
                                  itemType: SelectedLeftBarItem
                                      .patientBiomarkersBloodTest,
                                  item: ListTile(
                                    title: Text(
                                      'Blood Test',
                                      style: AppStyles.text14
                                          .andWeight(FontWeight.w400)
                                          .andColor(AppColors.textDarkGreen),
                                    ),
                                    onTap: () => controller.leftBarItemSelected(
                                        SelectedLeftBarItem
                                            .patientBiomarkersBloodTest),
                                  ))
                            ],
                          ),
                          Container(
                            decoration:
                                currentItem == SelectedLeftBarItem.patientRisks
                                    ? selectedDec
                                    : null,
                            child: ListTile(
                              onTap: () => controller.leftBarItemSelected(
                                  SelectedLeftBarItem.patientRisks),
                              title: Row(
                                children: [
                                  Image.asset(
                                    AppIcons.imageRisks,
                                    width: 28.w,
                                    height: 28.h,
                                  ),
                                  10.sbWidth,
                                  Text(
                                    'Risks',
                                    style: AppStyles.text18
                                        .andWeight(FontWeight.w400)
                                        .andColor(AppColors.textDarkGreen),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: currentItem ==
                                    SelectedLeftBarItem.patientInterventions
                                ? selectedDec
                                : null,
                            child: ListTile(
                              onTap: () => controller.leftBarItemSelected(
                                  SelectedLeftBarItem.patientInterventions),
                              title: Row(
                                children: [
                                  Image.asset(
                                    AppIcons.imageInterventions,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  10.sbWidth,
                                  Text(
                                    'Interventions',
                                    style: AppStyles.text18
                                        .andWeight(FontWeight.w400)
                                        .andColor(AppColors.textDarkGreen),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  32.sbHeight,
                  Container(
                    height: 1,
                    width: 231.w,
                    color: AppColors.borderLeftBar,
                  ),
                  20.sbHeight,
                  CollapsedItem(
                    title: 'Menu',
                    titleStyle: AppStyles.text16
                        .andWeight(FontWeight.w300)
                        .andColor(AppColors.textDarkGreen),
                    children: [
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            decoration:
                                currentItem == SelectedLeftBarItem.menuHome
                                    ? selectedDec
                                    : null,
                            child: ListTile(
                              onTap: () => controller.leftBarItemSelected(
                                  SelectedLeftBarItem.menuHome),
                              title: Row(
                                children: [
                                  Image.asset(
                                    AppIcons.imageHome,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  10.sbWidth,
                                  Text(
                                    'Home',
                                    style: AppStyles.text18
                                        .andWeight(FontWeight.w400)
                                        .andColor(AppColors.textDarkGreen),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration:
                                currentItem == SelectedLeftBarItem.menuSearch
                                    ? selectedDec
                                    : null,
                            child: ListTile(
                              onTap: () => controller.leftBarItemSelected(
                                  SelectedLeftBarItem.menuSearch),
                              title: Row(
                                children: [
                                  Image.asset(
                                    AppIcons.imageSearch,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  10.sbWidth,
                                  Text(
                                    'Search',
                                    style: AppStyles.text18
                                        .andWeight(FontWeight.w400)
                                        .andColor(AppColors.textDarkGreen),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration:
                                currentItem == SelectedLeftBarItem.menuChat
                                    ? selectedDec
                                    : null,
                            child: ListTile(
                              onTap: () => controller.leftBarItemSelected(
                                  SelectedLeftBarItem.menuChat),
                              title: Row(
                                children: [
                                  Image.asset(
                                    AppIcons.imageChat,
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                  10.sbWidth,
                                  Text(
                                    'Chat',
                                    style: AppStyles.text18
                                        .andWeight(FontWeight.w400)
                                        .andColor(AppColors.textDarkGreen),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}

enum SelectedLeftBarItem {
  patientOverview,
  patientAbout,
  patientBiomarkers,
  patientBiomarkersBloodTest,
  patientRisks,
  patientInterventions,
  menuHome,
  menuSearch,
  menuChat,
}
