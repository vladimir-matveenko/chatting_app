import 'dart:ui';

import 'package:flutter/material.dart';

class WaveDotsLoader extends StatefulWidget {
  const WaveDotsLoader({
    super.key,
    this.size = 10,
    this.spacing = 8,
    this.activeColor = const Color(0xFF7866FF),
    this.middleColor = const Color(0xFFA998FF),
    this.inactiveColor = const Color(0xFFE3DFFF),
    this.duration = const Duration(milliseconds: 2000),
  });

  final double size;
  final double spacing;

  final Color activeColor;
  final Color middleColor;
  final Color inactiveColor;

  final Duration duration;

  @override
  State<WaveDotsLoader> createState() => _WaveDotsLoaderState();
}

class _WaveDotsLoaderState extends State<WaveDotsLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const _dotCount = 3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _progress(int index) {
    final wave = _controller.value * (_dotCount - 1);
    final distance = (wave - index).abs();
    return (1.0 - distance).clamp(0.0, 1.0);
  }

  Color _color(int index) {
    final t = Curves.easeInOut.transform(_progress(index));

    if (t < 0.5) {
      return Color.lerp(widget.inactiveColor, widget.middleColor, t * 2)!;
    }

    return Color.lerp(widget.middleColor, widget.activeColor, (t - 0.5) * 2)!;
  }

  double _scale(int index) {
    final t = Curves.easeOut.transform(_progress(index));

    return lerpDouble(1.0, 1.35, t)!;
  }

  double _opacity(int index) {
    final t = Curves.easeOut.transform(_progress(index));

    return lerpDouble(0.55, 1.0, t)!;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(_dotCount, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
              child: Opacity(
                opacity: _opacity(index),
                child: Transform.scale(
                  scale: _scale(index),
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      color: _color(index),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
