library spline_chart;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

/// A Spline chart widget.
///
/// This widget draws a spline chart based on the given [values].
class SplineChart extends StatelessWidget {
  /// Width of the chart
  final double width;

  /// Height of the chart
  final double height;

  /// Padding on the X axis
  final double paddingX;
  
  /// Padding on the Y axis
  final double paddingY;

  /// Line chart values
  ///
  /// Each key in the hash map represents the X position and it's value as the Y position
  final Map<double, double> values;

  /// Should the X axis line be drawn?
  ///
  /// Defaults to true
  final bool drawXAxis;

  /// Should the Y axis line be drawn?
  ///
  /// Defaults to true
  final bool drawYAxis;

  /// Start of the X axis
  ///
  /// Defaults to 0
  final double xStart;

  /// End of the X axis
  ///
  /// Defaults to 100
  final double xEnd;

  /// Start of the Y axis
  ///
  /// Defaults to minimum of the data values
  final double? yStart;

  /// End of the Y axis
  ///
  /// Defaults to maximum of the data values
  final double? yEnd;

  /// The X axis lable intervals
  ///
  /// Defaults to 10
  final double xStep;

  /// Color of the line being drawn
  final Color lineColor;

  /// If true, grid lines will be drawn
  ///
  /// Default to true
  final bool gridLinesEnabled;

  /// Color of the grid lines
  final Color gridLineColor;

  /// Color of the label texts
  final Color textColor;

  /// Size of the label texts
  final double textSize;

  /// Thickness of the line
  final double strokeWidth;

  /// If true, fill underneath the spline will be drawn
  ///
  /// Default to true
  final bool fillEnabled;

  /// Color of the fill
  final Color fillColor;

  /// Opacity of the fill
  final double fillOpactiy;

  /// If true, a vertical line will be drawn at [verticalLinePosition]
  final bool verticalLineEnabled;

  /// Position of the vertical line
  final double verticalLinePosition;

  /// Thickness of the vertical line
  final double verticalLineStrokeWidth;

  /// Color of the vertical line
  final Color verticalLineColor;

  /// The text for the vertical line label
  ///
  /// Leave it empty if no label is needed
  final String? verticalLineText;

  /// If true, each data point would be highlighted by circles
  final bool drawCircles;

  /// Fill color of the data point circles
  final Color circleFillColor;

  /// Thickness of the data point circles
  final Color circleStrokeColor;

  /// Radius of the data point circles
  final double circleRadius;

  const SplineChart(
      {Key? key,
      required this.values,
      this.width = 320.0,
      this.height = 200.0,
      this.paddingX = 50.0,
      this.paddingY = 40.0,
      this.lineColor = Colors.black,
      this.gridLinesEnabled = true,
      this.gridLineColor = Colors.grey,
      this.textColor = Colors.grey,
      this.textSize = 14,
      this.drawXAxis = true,
      this.drawYAxis = true,
      this.xStart = 0,
      this.xEnd = 100,
      this.yStart,
      this.yEnd,
      this.xStep = 10,
      this.strokeWidth = 1,
      this.fillEnabled = true,
      this.fillColor = Colors.lightBlue,
      this.fillOpactiy = 0.5,
      this.verticalLineEnabled = false,
      this.verticalLinePosition = 0.0,
      this.verticalLineStrokeWidth = 1.0,
      this.verticalLineColor = Colors.red,
      this.verticalLineText,
      this.drawCircles = false,
      this.circleFillColor = Colors.lightBlueAccent,
      this.circleStrokeColor = Colors.black,
      this.circleRadius = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: this.width,
        height: this.height,
        child: CustomPaint(
            size: Size(this.width, this.height),
            painter: _SplineChartPainter(
              paddingX: this.paddingX,
              paddingY: this.paddingY,
              lineColor: this.lineColor,
              gridLinesEnabled: this.gridLinesEnabled,
              gridLineColor: this.gridLineColor,
              textColor: this.textColor,
              textSize: this.textSize,
              values: this.values,
              drawXAxis: this.drawXAxis,
              drawYAxis: this.drawYAxis,
              xStart: this.xStart,
              xEnd: this.xEnd,
              yStart: this.yStart,
              yEnd: this.yEnd,
              xStep: this.xStep,
              strokeWidth: this.strokeWidth,
              fillEnabled: this.fillEnabled,
              fillColor: this.fillColor,
              fillOpactiy: this.fillOpactiy,
              verticalLineColor: this.verticalLineColor,
              verticalLineEnabled: this.verticalLineEnabled,
              verticalLinePosition: this.verticalLinePosition,
              verticalLineStrokeWidth: this.verticalLineStrokeWidth,
              verticalLineText: this.verticalLineText,
              drawCircles: this.drawCircles,
              circleFillColor: this.circleFillColor,
              circleStrokeColor: this.circleStrokeColor,
              circleRadius: this.circleRadius,
            )),
      ),
    );
  }
}

class _SplineChartPainter extends CustomPainter {
  final double paddingX;
  final double paddingY;
  final Color lineColor;
  final bool gridLinesEnabled;
  final Color gridLineColor;
  final Color textColor;
  final double textSize;
  final bool fillEnabled;
  final Color fillColor;
  final double fillOpactiy;
  final Map<double, double> values;
  final bool drawXAxis;
  final bool drawYAxis;
  final double xStart;
  final double xEnd;
  final double? yStart;
  final double? yEnd;
  final double xStep;
  final double strokeWidth;
  final bool verticalLineEnabled;
  final double verticalLinePosition;
  final double verticalLineStrokeWidth;
  final Color verticalLineColor;
  final String? verticalLineText;
  final bool drawCircles;
  final double circleRadius;
  final Color circleFillColor;
  final Color circleStrokeColor;

  _SplineChartPainter({
    required this.paddingX,
    required this.paddingY,
    required this.lineColor,
    required this.gridLinesEnabled,
    required this.gridLineColor,
    required this.textColor,
    required this.textSize,
    required this.values,
    required this.drawXAxis,
    required this.drawYAxis,
    required this.xStart,
    required this.xEnd,
    required this.yStart,
    required this.yEnd,
    required this.xStep,
    required this.strokeWidth,
    required this.fillEnabled,
    required this.fillColor,
    required this.fillOpactiy,
    required this.verticalLineEnabled,
    required this.verticalLinePosition,
    required this.verticalLineStrokeWidth,
    required this.verticalLineColor,
    this.verticalLineText,
    required this.drawCircles,
    required this.circleStrokeColor,
    required this.circleFillColor,
    required this.circleRadius,
  });

  double _calcStepSize(double range, int targetSteps) {
    double tempStep = range / targetSteps;
    var magPow = pow(10, (log(tempStep) / ln10).floor());
    var magMsd = (tempStep / magPow + 0.5);
    if (magMsd > 5)
      magMsd = 10;
    else if (magMsd > 2)
      magMsd = 5;
    else if (magMsd > 1) magMsd = 2;
    return magMsd * magPow;
  }
    

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    double yMin = yStart ?? double.infinity,
        yMax = yEnd ?? double.negativeInfinity;
    values.forEach((key, value) {
      if (yStart == null) {
        yMin = min(value, yMin);
      }
      if (yEnd == null) {
        yMax = max(value, yMax);
      }
    });

    double yStep = _calcStepSize(yMax - yMin, 20);
    yMin = yMin - (yMin % yStep);
    yMax = ((yMax / yStep).floor() + 1) * yStep;

    // draw grid lines
    final axisLinePaint = Paint()
      ..color = gridLineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + strokeWidth / 2;

    final gridLinePaint = Paint()
      ..color = gridLineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth - strokeWidth / 2;

    // yAxis
    if (drawYAxis) {
      canvas.drawLine(Offset(paddingX, 0),
          Offset(paddingX, size.height - paddingY), axisLinePaint);
    }
    // xAxis
    if (drawXAxis) {
      canvas.drawLine(Offset(paddingX, size.height - paddingY),
          Offset(size.width, size.height - paddingY), axisLinePaint);
    }

    intl.NumberFormat numberFormat = intl.NumberFormat.decimalPattern('hi');

    double xRatio = (size.width - paddingX) / (this.xEnd - this.xStart);
    double yRatio = (size.height - paddingY) / (yMax - yMin);

    // draw vertical grid lines
    if (gridLinesEnabled) {
      for (double x = this.xStart; x <= this.xEnd; x += this.xStep) {
        canvas.drawLine(
            Offset(x * xRatio + paddingX, 0),
            Offset(x * xRatio + paddingX, size.height - paddingY),
            gridLinePaint);

        TextSpan span = TextSpan(
            style: TextStyle(color: this.textColor, fontSize: this.textSize),
            text: numberFormat.format(x.floor()));
        TextPainter tp =
            TextPainter(text: span, textDirection: TextDirection.ltr);
        tp.layout();
        tp.paint(
            canvas,
            Offset(x * xRatio + paddingX - tp.width / 2,
                size.height - paddingY + 5));
      }

      // draw horizontal grid lines
      for (double y = yMin; y <= (yMax); y += yStep) {
        double yPos = (size.height - paddingY) - ((y - yMin) * yRatio);
        canvas.drawLine(
            Offset(paddingX, yPos), Offset(size.width, yPos), gridLinePaint);

        TextSpan span = TextSpan(
            style: TextStyle(color: this.textColor, fontSize: this.textSize),
            text: numberFormat.format(y.floor()));
        TextPainter tp =
            TextPainter(text: span, textDirection: TextDirection.ltr);
        tp.layout();
        tp.paint(canvas, Offset(paddingX - tp.width - 5, yPos - tp.height / 2));
      }
    }

    // sort values by x position
    List<double> xValues = this.values.keys.toList();
    xValues.sort((a, b) => (a - b).floor());

    List<Offset> circles = [];

    final path = Path();
    for (int i = 0; i < xValues.length; i++) {
      if (i == 0) {
        if (xValues[0] == 0) {
          path.moveTo(
              paddingX,
              size.height -
                  paddingY -
                  ((values[xValues[0]] ?? 0) - yMin) * yRatio);
          circles.add(Offset(
              paddingX,
              size.height -
                  paddingY -
                  ((values[xValues[0]] ?? 0) - yMin) * yRatio));
        } else {
          path.moveTo(paddingX, size.height - paddingY - yMin);
          circles.add(Offset(paddingX, size.height - paddingY - yMin));
        }
      } else {
        final yPrevious = size.height -
            paddingY -
            ((values[xValues[i - 1]] ?? 0) - yMin) * yRatio;
        final xPrevious = xValues[i - 1] * xRatio + paddingX;
        final controlPointX =
            xPrevious + (xValues[i] * xRatio + paddingX - xPrevious) / 2;

        final yValue = size.height -
            paddingY -
            ((values[xValues[i]] ?? 0) - yMin) * yRatio;

        path.cubicTo(controlPointX, yPrevious, controlPointX, yValue,
            xValues[i] * xRatio + paddingX, yValue);

        circles.add(Offset(xValues[i] * xRatio + paddingX, yValue));
      }
    }
    canvas.drawPath(path, paint);

    if (drawCircles) {
      final circleFillPaint = Paint()
        ..color = circleFillColor
        ..style = PaintingStyle.fill
        ..strokeWidth = strokeWidth;

      final circleStrokePaint = Paint()
        ..color = circleStrokeColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;

      circles.forEach((offset) {
        canvas.drawCircle(offset, circleRadius, circleFillPaint);
        canvas.drawCircle(offset, circleRadius, circleStrokePaint);
      });
    }

    if (fillEnabled) {
      Path fillPath = Path()..addPath(path, Offset.zero);
      fillPath.relativeLineTo(strokeWidth / 2, 0.0);
      fillPath.lineTo(size.width, size.height - paddingY);
      fillPath.lineTo(size.width + strokeWidth / 2, size.height - paddingY);
      fillPath.lineTo(paddingX, size.height - paddingY);
      fillPath.close();

      Paint fillPaint = Paint()
        ..strokeWidth = 0.0
        ..color = fillColor.withOpacity(fillOpactiy)
        ..style = PaintingStyle.fill;
      canvas.drawPath(fillPath, fillPaint);
    }

    if (verticalLineEnabled) {
      final verticalLinePaint = Paint()
        ..color = verticalLineColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = verticalLineStrokeWidth;

      canvas.drawLine(
          Offset(verticalLinePosition * xRatio + paddingX, 0),
          Offset(
              verticalLinePosition * xRatio + paddingX, size.height - paddingY),
          verticalLinePaint);

      if (this.verticalLineText != null) {
        TextSpan span = TextSpan(
          style: TextStyle(color: verticalLineColor, fontSize: this.textSize),
          text: this.verticalLineText,
        );
        TextPainter tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        double x = verticalLinePosition * xRatio + paddingX + 5;
        if (x + tp.width > size.width) {
          x = verticalLinePosition * xRatio + paddingX - tp.width - 5;
        }
        tp.paint(canvas, Offset(x, 5));
      }
    }
  }

  @override
  bool shouldRepaint(_SplineChartPainter old) {
    return old.lineColor != lineColor ||
        old.gridLineColor != gridLineColor ||
        old.textColor != textColor ||
        old.textSize != textSize ||
        old.fillColor != fillColor ||
        old.fillOpactiy != fillOpactiy ||
        old.values != values ||
        old.xStart != xStart ||
        old.xEnd != xEnd ||
        old.xStep != xStep ||
        old.strokeWidth != strokeWidth ||
        old.verticalLineEnabled != verticalLineEnabled ||
        old.verticalLinePosition != verticalLinePosition ||
        old.verticalLineStrokeWidth != verticalLineStrokeWidth ||
        old.verticalLineColor != verticalLineColor ||
        old.verticalLineText != verticalLineText ||
        old.drawCircles != drawCircles ||
        old.circleRadius != circleRadius ||
        old.circleFillColor != circleFillColor ||
        old.circleStrokeColor != circleStrokeColor;
  }
}
