import 'package:material_ui/material_ui.dart';

class DisableBackNavigation extends StatelessWidget {
  const DisableBackNavigation({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: false, child: child);
  }
}
