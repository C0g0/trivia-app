import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: Stack(children: [
        BackgroundApp(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: Image.asset(
                  'assets/Logo.png',
                  width: width * 0.8,
                ),
              ),
              SizedBox(
                height: height * 0.2,
              ),
              MaterialButton(
                minWidth: width * 0.4,
                onPressed: () {
                  Navigator.pushNamed(context, 'categories');
                },
                color: Colors.white,
                shape: const StadiumBorder(),
                child: Text(
                  'Play',
                  style: GoogleFonts.bungee(
                      fontSize: height * 0.03,
                      color: const Color.fromARGB(255, 20, 0, 33)),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Ok!',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 20, 0, 33)),
                            ))
                      ],
                      title: Center(
                        child: Text(
                          'Instructions:',
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(height * 0.02),
                      content: SizedBox(
                        height: height * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1. Press the “Play” button to start playing.',
                              style:
                                  GoogleFonts.fredoka(fontSize: height * 0.02),
                            ),
                            Text(
                              '2. Choose a category of questions from the available options.',
                              style:
                                  GoogleFonts.fredoka(fontSize: height * 0.02),
                            ),
                            Text(
                              '3. You will see a series of questions with several answer options. Select the option you think is correct, each question has only one correct answer!',
                              style:
                                  GoogleFonts.fredoka(fontSize: height * 0.02),
                            ),
                            Text(
                              '4. When you complete all the questions, your score will be displayed. Congratulations on playing!',
                              style:
                                  GoogleFonts.fredoka(fontSize: height * 0.02),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                shape: const StadiumBorder(),
                child: Text(
                  'How to play?',
                  style: GoogleFonts.luckiestGuy(color: Colors.white54),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
