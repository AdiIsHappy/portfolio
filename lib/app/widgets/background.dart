import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants/colors.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  AlignmentGeometry _cursorPosition = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
            colors: const [TColors.backgroundCenter, TColors.backgroundEdge],
            radius: 0.7,
            center: _cursorPosition,
            stops: const [0.1, 1.0]),
      ),
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            // Update the cursor position based on the mouse event
            _cursorPosition = Alignment(
              event.localPosition.dx / MediaQuery.of(context).size.width * 2 -
                  1,
              event.localPosition.dy / MediaQuery.of(context).size.height * 2 -
                  1,
            );
          });
        },
      ),
    ));
  }
}
