import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/presentation/blocs/trivia/trivia_bloc.dart';
import 'package:quiz_app/presentation/widgets/widgets.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: BackgroundApp(child:
          BlocBuilder<TriviaBloc, TriviaState>(builder: (context, triviaState) {
        if (triviaState.loadingQuestions) {
          return _LoadingAlert(height, width);
        }
        return Container(
          color: Colors.green,
        );
      })),
    );
  }

  Center _LoadingAlert(double height, double width) {
    return Center(
      child: Container(
        height: height * 0.2,
        width: width * 0.5,
        margin: EdgeInsets.all(height * 0.05),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 253, 231),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
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
              'Creating new game...',
              style: GoogleFonts.poppins(
                  fontSize: height * 0.018, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
