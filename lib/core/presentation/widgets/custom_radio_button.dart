import 'package:flutter/material.dart';

class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.size = 24.0,
    this.innerPadding = 2,
    this.borderRadius = 4,
    this.selectedFillColor,
    this.selectedBorderColor,
    this.borderWidth = 1,
    this.isCircle = true,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  /// outer rectangle size
  final double size;
  final double innerPadding;
  final double borderRadius;
  final double borderWidth;
  final Color? selectedFillColor;
  final Color? selectedBorderColor;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? selectedBorderColor ?? theme.colorScheme.primary
                : theme.unselectedWidgetColor,
            width: borderWidth,
          ),
          borderRadius: isCircle ? null : BorderRadius.circular(borderRadius),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: isSelected
            ? Padding(
                padding: EdgeInsets.all(innerPadding),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedFillColor,
                    borderRadius: isCircle
                        ? null
                        : BorderRadius.circular(borderRadius),
                    shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
