import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/custom_dropdown_menu.dart';
import '../../utils.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  late Locale dropdownValue;
  late Locale initialValue;
  late TextTheme textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initialValue = context.locale;
    dropdownValue = initialValue;
    textTheme = Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdownMenu<Locale>(
      key: ValueKey(context.locale),
      initialValue: initialValue,
      leadingIcon: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: ProfileUtils.getLanguageIcon(dropdownValue.languageCode),
      ),
      onChanged: (value) {
        if (value != null) {
          setState(() {
            dropdownValue = value;
            context.setLocale(value);
          });
        }
      },
      entries: <DropdownMenuEntry<Locale>>[
        DropdownMenuEntry<Locale>(
          value: const Locale('en', 'US'),
          label: 'profileScreen.langEn'.tr(),
          leadingIcon: ProfileUtils.getLanguageIcon('en'),
          labelWidget: Text(
            'profileScreen.langEn'.tr(),
            style: textTheme.bodyMedium,
          ),
        ),
        DropdownMenuEntry<Locale>(
          value: const Locale('ru', 'RU'),
          label: 'profileScreen.langRu'.tr(),
          leadingIcon: ProfileUtils.getLanguageIcon('ru'),
          labelWidget: Text(
            'profileScreen.langRu'.tr(),
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
