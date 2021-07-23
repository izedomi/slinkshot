import 'package:flutter/material.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';

BoxDecoration gradientBoxDecoration(
    {AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    double borderRadius,
    int colorIndex}) {
  return BoxDecoration(
    color: bunkerBlack,
    gradient: LinearGradient(
        begin: begin, end: end, colors: borderGradients[colorIndex]),
    borderRadius: BorderRadius.circular(borderRadius),
  );
}

BoxDecoration innerDecoration({double borderRadius = 0}) {
  return BoxDecoration(
    color: bunkerBlack,
    borderRadius: BorderRadius.circular(borderRadius),
  );
}
