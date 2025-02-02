import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/presentation/blocs/trivia/trivia_bloc.dart';
import 'package:quiz_app/presentation/widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: BackgroundApp(
        child: Padding(
          padding: EdgeInsets.only(
              top: height * 0.05, left: width * 0.05, right: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Let\'s play!',
                style: GoogleFonts.bungee(
                    fontSize: height * 0.05, fontWeight: FontWeight.bold),
              ),
              Text(
                'Choose a category',
                style: GoogleFonts.luckiestGuy(
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(child: BlocBuilder<TriviaBloc, TriviaState>(
                builder: (context, triviaState) {
                  final categories = triviaState.categories;
                  return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: width * 0.05,
                          mainAxisSpacing: height * 0.03),
                      children: [
                        ...categories.map(
                          (categorie) => GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Center(
                                        child: Text(
                                          'Choose dificulty',
                                          style: GoogleFonts.poppins(
                                              fontSize: height * 0.03,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: height * 0.25,
                                        child: Column(
                                          children: [
                                            MaterialButton(
                                              minWidth: width * 0.3,
                                              elevation: 10,
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      'Creating new game...'),
                                                  duration:
                                                      Duration(seconds: 1),
                                                ));
                                              },
                                              shape: const StadiumBorder(),
                                              color: Colors.grey.shade300,
                                              splashColor: Colors.green,
                                              child: Text(
                                                'Easy',
                                                style: GoogleFonts.fredoka(
                                                    fontSize: height * 0.025,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.005,
                                            ),
                                            MaterialButton(
                                              onPressed: () {},
                                              minWidth: width * 0.3,
                                              elevation: 10,
                                              shape: const StadiumBorder(),
                                              color: Colors.grey.shade300,
                                              splashColor: Colors.orange,
                                              child: Text(
                                                'Medium',
                                                style: GoogleFonts.fredoka(
                                                    fontSize: height * 0.025,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.005,
                                            ),
                                            MaterialButton(
                                              onPressed: () {},
                                              minWidth: width * 0.3,
                                              elevation: 10,
                                              shape: const StadiumBorder(),
                                              color: Colors.grey.shade300,
                                              splashColor: Colors.red,
                                              child: Text(
                                                'Hard',
                                                style: GoogleFonts.fredoka(
                                                    fontSize: height * 0.025,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 255, 253, 231),
                                      Color.fromARGB(255, 255, 139, 4)
                                    ], // Colores del degradado
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      categorie.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.fredoka(
                                          fontSize: height * 0.018,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/icon_${categorie.id}.png',
                                    height: height * 0.12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ]);
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
