
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:longevity_ai/domain/patient.dart';
import 'package:longevity_ai/domain/test/test.dart';
import 'package:longevity_ai/logic/app_service.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/common/app_icons.dart';
import 'package:longevity_ai/ui/common/app_styles.dart';
import 'package:longevity_ai/ui/screens/main_screen/pages/blood_test_page/widgets/tests_widget.dart';

@RoutePage()
class BloodTestPage extends StatelessWidget{
  final controller = BloodTestPageController();
  BloodTestPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundWhite,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 32.h),
            child: Row(
              children: [
                Image.asset(AppIcons.imageSmallLogo, height: 52.h, width: 52.w,),
                18.sbWidth,
                Container(
                  width: 32.r,
                  height: 32.r,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundWhite,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.borderLeftBar)
                  ),
                  child: Image.asset(AppIcons.imageExpand, width: 32.r, height: 32.r,),
                ),
                56.sbWidth,
                Image.asset(AppIcons.imageSearch, width: 32.w, height: 32.h,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      hintText: 'Search for blood results and related biomarkers',
                      hintStyle: AppStyles.text14.andWeight(FontWeight.w400).andColor(AppColors.textHint)
                    ),
                  )
                ),
                50.sbWidth,
                CircleAvatar(
                  foregroundImage: AssetImage(AppIcons.imageStubAvatar,),
                  radius: 32.r,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Test',
                      style: AppStyles.text32.andWeight(FontWeight.w600),
                    ),
                    8.sbHeight,
                    Text(
                      getNameWithAge(),
                      style: AppStyles.text20.andWeight(FontWeight.w400),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    17.sbHeight,
                    Row(
                      children: [
                        Container(
                          width: 154.w,
                          height: 52.h,
                          padding: EdgeInsets.only(top: 10.h, right: 10.w, bottom: 10.h, left: 14.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.borderElements,)
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: Image.asset(AppIcons.imageSortList, width: 28.w, height: 28.h,),
//                        borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'Recent',
                                  style: AppStyles.text18.andWeight(FontWeight.w400).andColor(AppColors.textHint),
                                )
                              )
                            ],
                            focusColor: Colors.transparent,
                            underline: Container(),
                            onChanged: (_){}),
                        ),
                        18.sbWidth,
                        SizedBox(
                            width: 120.w, height: 52.h,
                          child: RawMaterialButton(

                            padding: EdgeInsets.only(top: 10.h, right: 10.w, bottom: 10.h, left: 14.w),
                            elevation: 0,
                            fillColor: AppColors.backgroundWhite,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: AppColors.borderElements),
                              borderRadius: BorderRadius.all(Radius.circular(12.r)
                              )
                            ),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            constraints: BoxConstraints.loose(Size(120.w, 52.h)),
                            onPressed: (){},
                            child: Row(
                              children: [
                                Image.asset(
                                  AppIcons.imageExport,
                                  height: 22.h,
                                  width: 22.w,
                                ),
                                const Spacer(),
                                Text(
                                  'Export',
                                  style: AppStyles.text18.andWeight(FontWeight.w400).andColor(AppColors.textHint),
                                )
                              ],
                            )
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          50.sbHeight,
          Expanded(child: TestsWidget(bloodTests: controller.patient.tests[TestType.bloodTest] ?? List<Test>.empty())),
          50.sbHeight
        ],
      ),
    );
  }
  String getNameWithAge(){
    final patient = controller.patient;
    final age = DateTime.now().year - patient.birthDate.year;
    return '${patient.firstName} ${patient.lastName} - age : $age';
  }
}

class BloodTestPageController{
  Patient get patient => AppService().repository.getPatient();
}