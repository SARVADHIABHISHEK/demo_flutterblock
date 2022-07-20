import 'package:flutter/material.dart';

class DemoCustomPaint extends StatefulWidget {
  const DemoCustomPaint({Key? key}) : super(key: key);

  @override
  State<DemoCustomPaint> createState() => _DemoCustomPaintState();
}

class _DemoCustomPaintState extends State<DemoCustomPaint> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          width: 300 ,
          height: 300,
          child: CustomPaint(
            foregroundPainter: LinePainter(),
          )
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final _paint = Paint()
    ..strokeWidth = 10
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    //..strokeCap = StrokeCap.round
  ;

  final Color lineColour = Colors.purple;


  @override
  void paint(Canvas canvas, Size size) {

    // Offset startingPoint = Offset(0, size.height / 2);
    // Offset endingPoint = Offset(size.width, size.height / 2);
    //
    // canvas.drawLine(startingPoint, endingPoint, _paint);

    final arc1 = Path();

    arc1.moveTo(size.width * 0.2, size.height * 0.2);
    arc1.arcToPoint(Offset(size.width * 0.8, size.height * 0.2),radius: const Radius.circular(150),clockwise: false);

    canvas.drawPath(arc1, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}





