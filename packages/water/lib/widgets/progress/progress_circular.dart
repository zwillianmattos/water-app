import 'dart:math';

import 'package:flutter/material.dart';

class ProgressDoughnutChart extends StatelessWidget {
  final double progress;
  final double radius = 100;
  final double strokeWidth = 40;
  final Color backgroundColor;
  final List<Color> progressColor;
  final String? label;

  ProgressDoughnutChart({
    required this.progress,
    this.backgroundColor = Colors.grey,
    this.label,
    List<Color>? progressColor,
  }) : progressColor =
            progressColor ?? const [Color(0xFF46E1FC), Color(0xFF0081F8)];

  @override
  Widget build(BuildContext context) {
    final Color labelColor = Theme.of(context).textTheme.bodyMedium!.color!;
    final Color percentColor = Theme.of(context).textTheme.bodyLarge!.color!;
    final bool isClockAspectRatio =
        MediaQuery.of(context).size.height <= 450;
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: _ProgressDoughnutChartPainter(
        label: label,
        progress: progress,
        radius: radius,
        strokeWidth: isClockAspectRatio ? strokeWidth / 1.5 : strokeWidth,
        backgroundColor: backgroundColor,
        progressColor: progressColor,
        labelColor: labelColor,
        percentColor: percentColor,
        isClockAspectRatio: isClockAspectRatio,
      ),
    );
  }
}

class _ProgressDoughnutChartPainter extends CustomPainter {
  final double progress;
  final double radius;
  final double strokeWidth;
  final Color backgroundColor;
  final Color labelColor;
  final Color percentColor;
  final List<Color> progressColor;
  final String? label;
  final bool isClockAspectRatio;

  _ProgressDoughnutChartPainter({
    required this.label,
    required this.progress,
    required this.radius,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
    required this.labelColor,
    required this.percentColor,
    this.isClockAspectRatio = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Paint progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = LinearGradient(
        colors: progressColor,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: radius,
        ),
      );

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    double startAngle = pi;
    double sweepAngle = 2 * pi * progress;

    if (isClockAspectRatio) {
      final double startAngleBackground = pi;
      final double sweepAngleBackground = 2 * pi * 0.5;

      startAngle = pi;
      sweepAngle = 2 * pi * (progress * 0.5);

      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius / 1.5),
        startAngleBackground,
        sweepAngleBackground,
        false,
        backgroundPaint,
      );
    } else {
      canvas.drawCircle(Offset(centerX, centerY), radius, backgroundPaint);
    }

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: isClockAspectRatio ? radius / 1.5 : radius,
      ),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    final TextPainter tp = TextPainter(
      text: TextSpan(
        text: '${(progress * 100).round().toString()}%',
        style: TextStyle(
          color: percentColor,
          fontSize: isClockAspectRatio ? 20 : 36,
          fontWeight: FontWeight.w700,
        ),
        children: label != null
            ? [
                TextSpan(
                  text: '\n${label}',
                  style: TextStyle(
                    color: labelColor,
                    fontSize: isClockAspectRatio ? 10 : 14,
                  ),
                ),
              ]
            : null,
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    tp.paint(
      canvas,
      Offset(
        centerX - tp.width / 2,
        isClockAspectRatio ? -25 : (centerY - tp.height / 2),
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
