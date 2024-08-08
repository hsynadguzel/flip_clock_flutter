import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClockItemWidget extends StatelessWidget {
  final String text;
  final bool isSmall;

  const ClockItemWidget({
    required this.text,
    this.isSmall = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSmall ? 60 : MediaQuery.of(context).size.width / 3,
      height: isSmall ? 36 : MediaQuery.of(context).size.height / 1.3,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 31, 31, 31),
        borderRadius: BorderRadius.circular(isSmall ? 6 : 16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scaleY: isSmall ? 1.0 : 1.7,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  text,
                  key: ValueKey(text),
                  style: GoogleFonts.montserrat(
                    color: const Color.fromARGB(255, 201, 201, 201),
                    fontSize: isSmall ? 16 : 180,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          if (!isSmall)
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 4,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }
}
