// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 7, 10, 12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.3675500, size.height * 0.2822000);
    path0.lineTo(size.width * 0.3665083, size.height * 0.7445000);
    path0.lineTo(size.width * 0.6323417, size.height * 0.7430714);
    path0.lineTo(size.width * 0.6331750, size.height * 0.2874143);
    path0.lineTo(size.width * 0.6190083, size.height * 0.2531286);
    path0.lineTo(size.width * 0.5715083, size.height * 0.2531286);
    path0.lineTo(size.width * 0.5681750, size.height * 0.2845571);
    path0.lineTo(size.width * 0.5508333, size.height * 0.2542857);
    path0.lineTo(size.width * 0.5033333, size.height * 0.2571429);
    path0.lineTo(size.width * 0.4991667, size.height * 0.2871429);
    path0.lineTo(size.width * 0.4833333, size.height * 0.2528571);
    path0.lineTo(size.width * 0.4358333, size.height * 0.2585714);
    path0.lineTo(size.width * 0.4325000, size.height * 0.2871429);
    path0.lineTo(size.width * 0.4166667, size.height * 0.2542857);
    path0.lineTo(size.width * 0.3741667, size.height * 0.2542857);
    path0.lineTo(size.width * 0.3675500, size.height * 0.2822000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
