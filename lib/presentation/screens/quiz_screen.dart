import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';

import 'package:quiz_app/domain/entities/question.dart';
import 'package:quiz_app/presentation/blocs/trivia/trivia_bloc.dart';
import 'package:quiz_app/presentation/widgets/widgets.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CardSwiperController cardSwiperController = CardSwiperController();
    final TriviaBloc triviaBloc = context.read<TriviaBloc>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: BackgroundApp(child:
          BlocBuilder<TriviaBloc, TriviaState>(builder: (context, triviaState) {
        if (triviaState.isLoading) {
          return LoadingAlert(
            height: height,
            width: width,
            content: 'Creating new game...',
          );
        }
        return Stack(
          children: [
            Positioned(
              top: height * 0.08,
              width: width * 0.8,
              left: width * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(height * 0.01),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 231),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.question_mark_rounded,
                        ),
                        Text(
                          '${triviaState.correctAnswers}/${triviaState.questions.length}',
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(height * 0.01),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 231),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.timer_outlined,
                        ),
                        Text(
                          '2:00',
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    color: const Color.fromARGB(255, 255, 253, 231),
                    shape: const StadiumBorder(),
                    onPressed: () {},
                    padding: EdgeInsets.all(height * 0.01),
                    child: Row(
                      children: [
                        // TODO Resume / Pause
                        const Icon(
                          Icons.play_arrow_rounded,
                        ),
                        Text(
                          'Resume',
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.pause,
                    //     ),
                    //     Text(
                    //       'Pause',
                    //       style: GoogleFonts.poppins(
                    //           fontSize: height * 0.02,
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //   ],
                    // ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: height * 0.03,
                width: width,
                child: Center(
                    child: MaterialButton(
                        shape: const StadiumBorder(),
                        color: Colors.red,
                        onPressed: () {},
                        child: Text(
                          'Quit',
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w500),
                        )))),
            _questionCards(
                triviaState, height, width, cardSwiperController, triviaBloc),
          ],
        );
      })),
    );
  }

  CardSwiper _questionCards(TriviaState triviaState, double height,
      double width, CardSwiperController controller, TriviaBloc triviaBloc) {
    return CardSwiper(
      cardBuilder: (context, index, horizontalOffsetPercentage,
          verticalOffsetPercentage) {
        final question = triviaState.questions[index];
        final answers = [...question.incorrectAnswers, question.correctAnswer];
        answers.shuffle(Random(50));
        final answersDecoded =
            answers.map((answer) => HtmlUnescape().convert(answer));
        return Center(
          child: Container(
            height: height * 0.7,
            width: width * 0.8,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.7,
                      2
                    ],
                    colors: [
                      Color.fromARGB(255, 255, 253, 231),
                      Color.fromARGB(255, 255, 139, 4)
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_brain.png',
                  height: height * 0.15,
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  HtmlUnescape().convert(question.question),
                  style: GoogleFonts.poppins(
                      fontSize: height * 0.02, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ...answersDecoded.map((answer) => Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: MaterialButton(
                              color: Colors.white,
                              minWidth: width * 0.6,
                              onPressed: () {
                                //evaluar respuesta correcta y mostrar alerta
                                _answerAlert(context, controller, width, height,
                                    answer, question);
                                //ToDo
                                //almacenar respuestas correctas
                                if (answer == question.correctAnswer) {
                                  triviaBloc.add(const NewCorrectAnswer());
                                }
                                //mostrar numero de preguntas que avanzamos

                                //pausar y reanudar temporizador

                                // controller.swipe(CardSwiperDirection.left);
                              },
                              shape: StadiumBorder(
                                  side: BorderSide(
                                      color: Colors.grey.shade500, width: 2)),
                              child: Center(
                                child: Text(
                                  answer,
                                  style: GoogleFonts.luckiestGuy(
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      controller: controller,
      cardsCount: triviaState.questions.length,
      isLoop: false,
      numberOfCardsDisplayed: 5,
      backCardOffset: Offset(0, height * 0.05),
      allowedSwipeDirection: const AllowedSwipeDirection.none(),
      duration: const Duration(milliseconds: 500),
      onEnd: () {
        //ToDo Transición a la pantalla final
      },
    );
  }

  Future<dynamic> _answerAlert(
      BuildContext context,
      CardSwiperController controller,
      double width,
      double height,
      String answer,
      Question question) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    //ToDo:
                    // Reanudar el temporizador
                    controller.swipe(CardSwiperDirection.left);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        color: const Color.fromARGB(255, 255, 253, 231),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                        child: Text(
                      'Next question',
                      style: GoogleFonts.poppins(
                          fontSize: height * 0.015,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
              ),
            ],
            content: SizedBox(
              height: height * 0.3,
              child: Column(
                children: [
                  Image.asset(
                    (answer == question.correctAnswer)
                        ? 'assets/check.png'
                        : 'assets/cross.png',
                    width: width * 0.3,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Text(
                    'Correct Answer',
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.018, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    question.correctAnswer,
                    style: GoogleFonts.bungee(fontSize: height * 0.018),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
