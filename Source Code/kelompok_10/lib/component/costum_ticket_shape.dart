import 'package:flutter/material.dart';

class CustomTicketShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(12)));
    path.addOval(
      Rect.fromCircle(
        center: Offset(0, (size.height / 5) * 1.8),
        radius: 15,
      ),
    );
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width, (size.height / 5) * 1.8),
        radius: 15,
      ),
    );
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

@immutable
class ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  const ClipShadowPath({
    Key? key,
    required this.shadow,
    required this.clipper,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: UniqueKey(),
      painter: _ClipShadowShadowPainter(
        clipper: clipper,
        shadow: shadow,
      ),
      child: ClipPath(clipper: clipper, child: child),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
