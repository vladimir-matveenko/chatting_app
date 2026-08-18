import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatefulWidget {
  const PinCodeField({
    super.key,
    this.errorText,
    required this.length,
    required this.onCompleted,
    this.controller,
    this.inactiveColor,
    this.disableErrorText = false,
  });

  final PinInputController? controller;
  final String? errorText;
  final int length;
  final Function(String) onCompleted;
  final Color? inactiveColor;
  final bool disableErrorText;

  @override
  State<PinCodeField> createState() => _PinCodeFieldState();
}

class _PinCodeFieldState extends State<PinCodeField> {
  late final PinInputController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? PinInputController();

    if (widget.errorText?.isNotEmpty == true) {
      _controller.triggerError();
    }
  }

  @override
  void didUpdateWidget(covariant PinCodeField oldWidget) {
    super.didUpdateWidget(oldWidget);
    final hasError = widget.errorText?.isNotEmpty == true;
    if (hasError) {
      _controller.triggerError();
    } else {
      _controller.clearError();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.headlineLarge?.copyWith(fontSize: 14.0);

    return MaterialPinField(
      pinController: _controller,
      length: widget.length,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      clearErrorOnInput: true,
      onCompleted: widget.onCompleted,
      errorText: widget.disableErrorText ? null : widget.errorText,
      errorBuilder: (errorText) {
        if (errorText == null || errorText.isEmpty) {
          return const SizedBox.shrink();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorText,
              style: textStyle?.copyWith(color: theme.colorScheme.error),
            ),
          ],
        );
      },
      theme: MaterialPinTheme(
        shape: MaterialPinShape.outlined,
        borderRadius: BorderRadius.circular(8.0),
        cellSize: const Size(40, 40),
        errorTextStyle: textStyle?.copyWith(color: theme.colorScheme.error),
        textStyle: textStyle,
        focusedBorderColor: theme.inputDecorationTheme.focusColor,
        completeBorderColor: theme.inputDecorationTheme.focusColor,
        borderColor: theme.inputDecorationTheme.enabledBorder?.borderSide.color,
        errorBorderColor: theme.colorScheme.error,
        errorBorderWidth: 1,
        fillColor: theme.colorScheme.surfaceTint,
        focusedFillColor: theme.colorScheme.surfaceTint,
        completeFillColor: theme.bottomNavigationBarTheme.backgroundColor,
        followingFillColor: theme.bottomNavigationBarTheme.backgroundColor,
      ),
    );
  }
}
