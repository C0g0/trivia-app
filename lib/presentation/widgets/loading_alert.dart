import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingAlert extends StatelessWidget {
  const LoadingAlert({
    super.key,
    required this.content,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height * 0.2,
        width: width * 0.5,
        margin: EdgeInsets.all(height * 0.05),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 253, 231),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              // backgroundColor: Colors.red,
              strokeWidth: 8,
              strokeCap: StrokeCap.butt,
              strokeAlign: 1,
              color: Color.fromARGB(255, 255, 139, 4),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              content,
              style: GoogleFonts.poppins(
                  fontSize: height * 0.018, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
