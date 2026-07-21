import 'package:chatting_app/core/presentation/widgets/scroll_up_button.dart';
import 'package:flutter/material.dart';

class ScrollWrapper extends StatelessWidget {
  const ScrollWrapper({
    super.key,
    required this.controller,
    required this.child,
    this.reverse = false,
  });

  final ScrollController controller;
  final Widget child;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ScrollUpButton(scrollController: controller, reverse: reverse),
        ),
      ],
    );
  }
}
