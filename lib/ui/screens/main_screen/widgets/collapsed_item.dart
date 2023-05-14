import 'package:flutter/material.dart';

class CollapsedItem extends StatefulWidget {
  const CollapsedItem(
    {
      super.key,
      required this.children,
      this.leading,
      required this.title,
      this.trailing = true,
      this.titleStyle
    }
  );
  final List<Widget> children;
  final Image? leading;
  final bool trailing;
  final TextStyle? titleStyle;
  final String title;
  @override
  State<StatefulWidget> createState() {
    return CollapsedItemState();
  }
}

class CollapsedItemState extends State<CollapsedItem> {
  bool _expanded = false;
  CollapsedItemState();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const Border(),
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(10.r))),
      // collapsedShape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(10.r))),
      // backgroundColor: AppColors.backgroundRose,
      // collapsedBackgroundColor: AppColors.backgroundRose,
      onExpansionChanged: (state) => setState(() => _expanded = state),
      trailing: Icon(
        _expanded ?  Icons.expand_more : Icons.expand_less
      ),
      title: Row(
        children: [
          if (widget.leading != null) ...[widget.leading!],
          Text(
            widget.title,
            style: widget.titleStyle
          ),
        ],
      ),
      children: widget.children,
    );
  }
}
