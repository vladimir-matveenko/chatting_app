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
  late String dropdownValue;
  late String initialValue;
  late TextTheme textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initialValue = context.locale.languageCode;
    dropdownValue = initialValue;
    textTheme = Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdownMenu<String>(
      key: ValueKey(context.locale),
      initialValue: initialValue,
      leadingIcon: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: ProfileUtils.getLanguageIcon(dropdownValue),
      ),
      onChanged: (value) {
        if (value != null) {
          setState(() {
            dropdownValue = value;
            context.setLocale(Locale(value));
          });
        }
      },
      entries: <DropdownMenuEntry<String>>[
        DropdownMenuEntry<String>(
          value: 'en-US',
          label: 'profileScreen.langEn'.tr(),
          leadingIcon: ProfileUtils.getLanguageIcon('en'),
          labelWidget: Text(
            'profileScreen.langEn'.tr(),
            style: textTheme.bodyMedium,
          ),
        ),
        DropdownMenuEntry<String>(
          value: 'ru-RU',
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
