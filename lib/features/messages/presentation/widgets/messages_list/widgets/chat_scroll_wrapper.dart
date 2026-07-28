import 'package:flutter/material.dart';

import '../controllers/chat_scroll_controller.dart';
import 'scroll_to_bottom_button.dart';

class ChatScrollWrapper extends StatelessWidget {
  const ChatScrollWrapper({
    super.key,
    required this.controller,
    required this.child,
  });

  final ChatScrollController controller;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ScrollToBottomButton(controller: controller),
        ),
      ],
    );
  }
}
