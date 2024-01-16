
import 'package:flutter/material.dart';

class RadioTile extends StatelessWidget {
  final double height;
  final Widget leading;
  final Widget title;
  const RadioTile(
      {super.key,
      required this.height,
      required this.leading,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height + 15,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 15, right: 15, top: 7.5, bottom: 7.5),
            width: height + 30,
            child: leading,
          ),
          SizedBox(
            child: title,
          )
        ],
      ),
    );
  }
}

class MultipleSeletionRadio extends StatelessWidget {
  final bool isSelected;
  final Color color;
  const MultipleSeletionRadio(
      {super.key, required this.isSelected, required this.color});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: Size(width, height),
              painter: BorderPainter(color: color, isSelected: isSelected),
            ),
          ),
          if (isSelected) ...[
            Center(
              child: CustomPaint(
                size: Size(width, height),
                painter:
                    CenterFillPainter(color: color, isSelected: isSelected),
              ),
            )
          ]
        ],
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  Color color;
  Paint? _paint;
  final bool isSelected;
  BorderPainter({required this.color, required this.isSelected}) {
    _paint = Paint()
      ..color = isSelected ? color : Colors.grey[350]!
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint!,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CenterFillPainter extends CustomPainter {
  Color color;
  Paint? _paint;
  final bool isSelected;
  CenterFillPainter({required this.color, required this.isSelected}) {
    _paint = Paint()
      ..color = isSelected ? color : Colors.grey
      ..strokeWidth = 2.5
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(4, 4, size.width - 8, size.height - 8),
      _paint!,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
