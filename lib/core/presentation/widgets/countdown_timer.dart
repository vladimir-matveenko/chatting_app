import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CountdownController extends ChangeNotifier {
  CountdownController({this.onFinished});

  final VoidCallback? onFinished;

  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isFinished = true;

  int get remainingSeconds => _remainingSeconds;

  bool get isFinished => _isFinished;

  void start(int seconds) {
    _timer?.cancel();

    _remainingSeconds = seconds;
    _isFinished = seconds <= 0;

    notifyListeners();

    if (_isFinished) {
      return;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingSeconds <= 1) {
        _remainingSeconds = 0;
        _isFinished = true;

        _timer?.cancel();
        _timer = null;

        notifyListeners();
        onFinished?.call();

        return;
      }

      _remainingSeconds--;
      notifyListeners();
    });
  }

  void restart(int seconds) {
    start(seconds);
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    super.key,
    required this.controller,
    this.initialSeconds = 0,
    this.onFinishedPlaceholder,
  });

  final CountdownController controller;
  final int initialSeconds;
  final Widget? onFinishedPlaceholder;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_onControllerChanged);

    if (widget.controller.remainingSeconds == 0 && widget.initialSeconds > 0) {
      widget.controller.start(widget.initialSeconds);
    }
  }

  @override
  void didUpdateWidget(covariant CountdownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onControllerChanged);
      widget.controller.addListener(_onControllerChanged);

      if (widget.controller.remainingSeconds == 0 &&
          widget.initialSeconds > 0) {
        widget.controller.start(widget.initialSeconds);
      }
    }
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');

    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium;
    final finishedColor = theme.colorScheme.error;

    final isFinished = widget.controller.isFinished;

    final timerWidget = Text(
      _formatTime(widget.controller.remainingSeconds),
      style: isFinished ? textStyle?.copyWith(color: finishedColor) : textStyle,
    );

    if (widget.onFinishedPlaceholder != null) {
      return isFinished ? widget.onFinishedPlaceholder! : timerWidget;
    }

    return Row(
      mainAxisSize: .min,
      mainAxisAlignment: .center,
      spacing: 8.0,
      children: [
        timerWidget,
        if (isFinished)
          Text(
            'resetPasswordScreen.timeIsUp'.tr(),
            style: textStyle?.copyWith(color: finishedColor),
          ),
      ],
    );
  }
}
