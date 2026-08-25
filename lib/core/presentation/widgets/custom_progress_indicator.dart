import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({
    super.key,
    required this.initialValue,
    required this.currentValue,
    this.size = 160,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.textStyle,
    this.strokeWidth = 3,
    this.tickLength = 10,
  }) : assert(initialValue >= 0),
       assert(currentValue >= 0),
       assert(currentValue <= initialValue);

  final int initialValue;
  final int currentValue;

  final double size;

  final Color activeColor;
  final Color inactiveColor;

  final TextStyle? textStyle;

  final double strokeWidth;
  final double tickLength;

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animation = AlwaysStoppedAnimation(widget.currentValue.toDouble());

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void didUpdateWidget(covariant CustomProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentValue != widget.currentValue) {
      _animateValue(
        from: oldWidget.currentValue.toDouble(),
        to: widget.currentValue.toDouble(),
      );
    }
  }

  void _animateValue({required double from, required double to}) {
    _controller.stop();

    _animation = Tween<double>(
      begin: from,
      end: to,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tickCount = math.min(widget.initialValue, 60);

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          final value = _animation.value;

          return CustomPaint(
            painter: _CountdownPainter(
              initialValue: widget.initialValue,
              currentValue: value,
              tickCount: tickCount,
              activeColor: widget.activeColor,
              inactiveColor: widget.inactiveColor,
              strokeWidth: widget.strokeWidth,
              tickLength: widget.tickLength,
            ),
            child: Center(
              child: Text(
                value.round().clamp(0, 99).toString().padLeft(2, '0'),
                style:
                    widget.textStyle ??
                    Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CountdownPainter extends CustomPainter {
  const _CountdownPainter({
    required this.initialValue,
    required this.currentValue,
    required this.tickCount,
    required this.activeColor,
    required this.inactiveColor,
    required this.strokeWidth,
    required this.tickLength,
  });

  final int initialValue;
  final double currentValue;
  final int tickCount;

  final Color activeColor;
  final Color inactiveColor;

  final double strokeWidth;
  final double tickLength;

  @override
  void paint(Canvas canvas, Size size) {
    if (tickCount <= 0) {
      return;
    }

    final center = Offset(size.width / 2, size.height / 2);

    final radius = math.min(size.width, size.height) / 2;

    final tickRadius = radius - tickLength / 2;

    final inactivePaint = Paint()
      ..color = inactiveColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final activePaint = Paint()
      ..color = activeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    const startAngle = -math.pi / 2;

    final angleStep = 2 * math.pi / tickCount;

    final elapsed = (initialValue - currentValue).clamp(
      0.0,
      tickCount.toDouble(),
    );

    // ---------------------------------------------------------------
    // Labels
    // ---------------------------------------------------------------

    for (var i = 0; i < tickCount; i++) {
      final angle = startAngle + i * angleStep;

      final startRadius = tickRadius - tickLength / 2;
      final endRadius = tickRadius + tickLength / 2;

      final start = Offset(
        center.dx + math.cos(angle) * startRadius,
        center.dy + math.sin(angle) * startRadius,
      );

      final end = Offset(
        center.dx + math.cos(angle) * endRadius,
        center.dy + math.sin(angle) * endRadius,
      );

      final isActive = elapsed >= tickCount ? true : i > 0 && i <= elapsed;

      canvas.drawLine(start, end, isActive ? activePaint : inactivePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _CountdownPainter oldDelegate) {
    return oldDelegate.initialValue != initialValue ||
        oldDelegate.currentValue != currentValue ||
        oldDelegate.tickCount != tickCount ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.inactiveColor != inactiveColor ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.tickLength != tickLength;
  }
}
