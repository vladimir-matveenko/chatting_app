import 'package:chatting_app/features/notifications/utils.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/entity/availability_filter_entity.dart';
import '../../data/enums/notification_type.dart';

class TypeFilterBlock extends StatelessWidget {
  const TypeFilterBlock({
    super.key,
    required this.availabilityFilters,
    required this.onChangeFilter,
    required this.onDisableFilters,
  });

  final List<AvailabilityFilterEntity> availabilityFilters;
  final Function(AvailabilityFilterEntity) onChangeFilter;
  final VoidCallback onDisableFilters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filters = List<Widget>.generate(
      NotificationType.values.length,
      (i) => FilterItem(
        value: NotificationType.values[i],
        selectedValue: availabilityFilters.isNotEmpty
            ? availabilityFilters.first.apiValue
            : null,
        onChanged: (value) {
          final filter = AvailabilityFilterEntity(
            groupName: 'types',
            displayName: value.name,
            value: value.name,
            apiValue: value,
          );
          onChangeFilter(filter);
        },
      ),
    );

    return Container(
      padding: const .all(8.0),
      color: theme.bottomNavigationBarTheme.backgroundColor,
      child: Row(
        children: [Wrap(spacing: 8.0, runSpacing: 8.0, children: filters)],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.value,
    this.selectedValue,
    required this.onChanged,
  });

  final NotificationType value;
  final NotificationType? selectedValue;
  final Function(NotificationType) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = value == selectedValue;
    return IconButton(
      onPressed: () {
        onChanged(value);
      },
      icon: Icon(
        NotificationsUtils.getNotificationTypeIcon(value),
        size: 24.0,
        color: isSelected ? theme.colorScheme.primary : null,
      ),
    );
  }
}
