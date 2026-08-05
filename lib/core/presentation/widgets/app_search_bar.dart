import 'package:chatting_app/app/utils/extensions.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, this.height = 40.0, required this.onChanged});

  final double height;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.isDark()
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.primary;
    return SizedBox(
      height: height,
      child: SearchBar(
        leading: Icon(Icons.search, color: iconColor),
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: onChanged,
      ),
    );
  }
}
