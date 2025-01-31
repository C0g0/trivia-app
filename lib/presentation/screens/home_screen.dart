import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background_bars.png'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            top: height * 0.1,
            left: width * 0.1,
            child: Image.asset(
              'assets/Logo.png',
              width: width * 0.8,
            )),
        Positioned(
            bottom: height * 0.05,
            left: width * 0.3,
            child: Column(
              children: [
                MaterialButton(
                  minWidth: width * 0.4,
                  onPressed: () {
                    Navigator.pushNamed(context, 'categories');
                  },
                  color: Colors.white,
                  shape: const StadiumBorder(),
                  child: Text(
                    'Play',
                    style: TextStyle(
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
                        title: Text(
                          'Instructions:',
                          style: TextStyle(fontSize: height * 0.04),
                        ),
                        contentPadding: EdgeInsets.all(height * 0.02),
                        content: SizedBox(
                          height: height * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1. Press the “Play” button to start playing.',
                                style: TextStyle(fontSize: height * 0.02),
                              ),
                              Text(
                                '2. Choose a category of questions from the available options.',
                                style: TextStyle(fontSize: height * 0.02),
                              ),
                              Text(
                                '3. You will see a series of questions with several answer options. Select the option you think is correct, each question has only one correct answer!',
                                style: TextStyle(fontSize: height * 0.02),
                              ),
                              Text(
                                '4. When you complete all the questions, your score will be displayed. Congratulations on playing!',
                                style: TextStyle(fontSize: height * 0.02),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  shape: const StadiumBorder(),
                  child: const Text(
                    'How to play?',
                    style: TextStyle(color: Colors.white54),
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
