import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:material_ui/material_ui.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: const AppLoader(),
    );
  }
}
