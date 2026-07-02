import 'package:flutter/material.dart';

class ScrolledWrapper extends StatelessWidget {
  const ScrolledWrapper({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const .symmetric(horizontal: 16),
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: .center,
              spacing: 16.0,
              children: children,
            ),
          ),
        );
      },
    );
  }
}
