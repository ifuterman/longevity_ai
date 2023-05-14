import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:longevity_ai/ui/common/app_colors.dart';
import 'package:longevity_ai/ui/common/app_extensions.dart';
import 'package:longevity_ai/ui/screens/main_screen/main_screen.dart';

import 'left_bar.dart';

class SubMenuItem extends ConsumerWidget{
  const SubMenuItem(
    {
      super.key,
      required this.selectedItemProvider,
      required this.items,
      required this.title,
      required this.itemType,
      this.onTap,
    }
  );

  final SelectedItemNotifierProvider selectedItemProvider;
  final List<SubItem> items;
  final Widget title;
  final SelectedLeftBarItem itemType;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentItem = ref.watch(selectedItemProvider);
    debugPrint('SubMenuItem.build currentItem = $currentItem, itemType = $itemType');
    if(currentItem == itemType){
      return buildExpandedItem(context, currentItem);
    }
    for(final item in items){
      if(item.itemType == currentItem){
        return buildExpandedItem(context, currentItem);
      }
    }
    return ListTile(
      title: title,
      onTap: onTap,
    );
  }

  Widget buildExpandedItem(BuildContext context, SelectedLeftBarItem currentItem){
    debugPrint('SubMenuItem.buildExpandedItem items.length = ${items.length}');
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundMenu,
        //  color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(12.r))
      ),
      child: Column(
        children: [
          ListTile(
            title: title,
            onTap: onTap,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  decoration: BoxDecoration(
                    color: items[index].itemType ==  currentItem ?
                      AppColors.backgroundWhite : AppColors.backgroundMenu,
                    borderRadius: BorderRadius.all(Radius.circular(10.r))
                  ),
                  child: items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SubItem extends StatelessWidget{
  const SubItem({super.key, required SelectedLeftBarItem itemType, required this.item}) : _itemType = itemType;
  final SelectedLeftBarItem _itemType;
  SelectedLeftBarItem get itemType => _itemType;
  final ListTile item;
  @override
  Widget build(BuildContext context) {
    return item;
  }

}