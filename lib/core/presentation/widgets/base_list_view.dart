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
  });

  final EdgeInsets? padding;
  final List<T> items;
  final Widget? separator;
  final ScrollController? controller;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      controller: controller,
      itemCount: items.length,
      physics: const ClampingScrollPhysics(),
      padding: padding ?? const .symmetric(vertical: 16.0),
      shrinkWrap: true,
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
