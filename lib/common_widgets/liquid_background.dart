import 'dart:math' as math;
import 'package:flutter/material.dart';

class LiquidBackground extends StatefulWidget {
  final List<Color> colors;
  const LiquidBackground({super.key, required this.colors});

  @override
  State<LiquidBackground> createState() => _LiquidBackgroundState();
}

class _LiquidBackgroundState extends State<LiquidBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _LiquidPainter(
            animation: _controller.value,
            colors: widget.colors,
          ),
          child: Container(),
        );
      },
    );
  }
}

class _LiquidPainter extends CustomPainter {
  final double animation;
  final List<Color> colors;

  _LiquidPainter({required this.animation, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..maskFilter = const MaskFilter.blur(BlurStyle.normal, 60);

    for (int i = 0; i < colors.length; i++) {
      final color = colors[i];
      final phase = (i * math.pi * 2) / colors.length;
      
      final x = size.width / 2 + 
          math.sin(animation * math.pi * 2 + phase) * (size.width * 0.3);
      final y = size.height / 2 + 
          math.cos(animation * math.pi * 2 + phase * 1.5) * (size.height * 0.3);
      
      final radius = size.width * (0.4 + 0.1 * math.sin(animation * math.pi * 2 + phase));
      
      canvas.drawCircle(Offset(x, y), radius, paint..color = color.withOpacity(0.4));
    }
  }

  @override
  bool shouldRepaint(_LiquidPainter oldDelegate) => true;
}
