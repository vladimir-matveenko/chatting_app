import 'package:flutter/material.dart';

class MessageContent extends StatelessWidget {
  const MessageContent({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null || text!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Text(text!, style: Theme.of(context).textTheme.bodyMedium);
  }
}
