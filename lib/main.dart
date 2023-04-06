import 'package:flutter/material.dart';
import 'package:joys/joys.dart';
import 'package:joys/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const  JoystickExample()
    );
  }
}



class DotPainter extends CustomPainter {
  final List<Offset> points;
  final Paint dotPaint;
  final Paint linePaint;

  DotPainter(this.points, this.dotPaint, this.linePaint);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length; i++) {
      canvas.drawCircle(points[i], 5.0, dotPaint);
      if (i < points.length - 1) {
        canvas.drawLine(points[i], points[i + 1], linePaint);
      }
    }
  }

  @override
  bool shouldRepaint(DotPainter oldDelegate) {
    return points != oldDelegate.points ||
        dotPaint != oldDelegate.dotPaint ||
        linePaint != oldDelegate.linePaint;
  }
}


