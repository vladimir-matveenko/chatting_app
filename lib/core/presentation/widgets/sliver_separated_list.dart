import 'package:flutter/material.dart';

class SliverSeparatedList extends StatelessWidget {
  const SliverSeparatedList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.separatorBuilder,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return separatorBuilder != null
        ? SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final itemIndex = index ~/ 2;

              if (index.isEven) {
                return itemBuilder(context, itemIndex);
              }

              return separatorBuilder!(context, itemIndex);
            }, childCount: itemCount * 2 - 1),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              itemBuilder,
              childCount: itemCount,
            ),
          );
  }
}
