import 'package:flutter/material.dart';

class BaseListView<T> extends StatelessWidget {
  const BaseListView({
    super.key,
    this.padding,
    required this.items,
    this.separator,
    this.controller,
    required this.itemBuilder,
    this.reverse = false,
    this.listViewKey,
    this.scrollable = true,
  });

  final GlobalKey? listViewKey;
  final EdgeInsets? padding;
  final List<T> items;
  final Widget? separator;
  final ScrollController? controller;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool reverse;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      key: listViewKey,
      controller: controller,
      itemCount: items.length,
      physics: scrollable
          ? const ClampingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      padding: padding ?? const .symmetric(vertical: 16.0),
      shrinkWrap: scrollable,
      reverse: reverse,
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) =>
          separator ??
          Divider(
            height: 16.0,
            thickness: 1.0,
            color: theme.unselectedWidgetColor,
          ),
    );
  }
}
