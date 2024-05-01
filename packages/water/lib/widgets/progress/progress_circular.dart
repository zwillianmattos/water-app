import 'dart:math';

import 'package:flutter/material.dart';

class ProgressDoughnutChart extends StatelessWidget {
  final double progress;
  final double radius;
  final double strokeWidth;
  final Color backgroundColor;
  final List<Color> progressColor;
  final String? label;

  ProgressDoughnutChart({
    required this.progress,
    required this.radius,
    this.strokeWidth = 10.0,
    this.backgroundColor = Colors.grey,
    this.label,
    List<Color>? progressColor,
  }) : this.progressColor =
            progressColor ?? [Color(0xFF46E1FC), Color(0xFF0081F8)];

  @override
  Widget build(BuildContext context) {
    final Color labelColor = Theme.of(context).textTheme.bodyMedium!.color!;
    final Color percentColor = Theme.of(context).textTheme.bodyLarge!.color!;

    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: _ProgressDoughnutChartPainter(
        label,
        progress: progress,
        radius: radius,
        strokeWidth: strokeWidth,
        backgroundColor: backgroundColor,
        progressColor: progressColor,
        labelColor: labelColor,
        percentColor: percentColor,
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

  _ProgressDoughnutChartPainter(this.label,
      {required this.progress,
      required this.radius,
      required this.strokeWidth,
      required this.backgroundColor,
      required this.progressColor,
      required this.labelColor,
      required this.percentColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Paint progressPaint = Paint()
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

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    canvas.drawCircle(Offset(centerX, centerY), radius, backgroundPaint);

    double startAngle = pi;
    double sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    var progressPercent = 100 - (progress * 100);

    TextPainter tp = TextPainter(
      text: TextSpan(
        text: '${progressPercent.round().toStringAsFixed(0)}%',
        style: TextStyle(color: percentColor, fontSize: 36, fontWeight: FontWeight.w700),
        children: label != null
            ? [
                TextSpan(
                  text: '\n${label}',
                  style: TextStyle(color: labelColor, fontSize: 14),
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
      Offset(centerX - tp.width / 2, centerY - tp.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
