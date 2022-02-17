import 'package:flutter/material.dart';
import 'package:flutter_quiz/colors/color.dart';
import 'package:flutter_quiz/data/question_list.dart';

import '../screens/result_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //STEP 1: Nesecitamos crear la estructura de folderes del proyecto
  //STEP 2: Necesitamos crear el modelo de cuestionario QUIZZ
  //STEP 3: Nesecitamos una lista simple de preguntas display it
  //en nuestra pantalla, por supuesto, puede usar su propia lista u obtener datos
  //desde un API existente
  //empecemos

  PageController? _controller = PageController(initialPage: 0);

  bool isPressed = false;
  Color isTrues = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = secondColor;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Pregunta de quiz ${index + 1}/${questions.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  questions[index].question!,
                  style: const TextStyle(color: Colors.white, fontSize: 28.0),
                ),
                SizedBox(
                  height: 35.0,
                ),
                for (int i = 0; i < questions[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 18.0),
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      color: isPressed
                          ? questions[index].answers!.entries.toList()[i].value
                              ? isTrues
                              : isWrong
                          : secondColor,
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answers!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                                print(score);
                              }
                            },
                      child: Text(
                        questions[index].answers!.keys.toList()[i],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: isPressed
                          ? index + 1 == questions.length
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ResultScreen(score)));
                                }
                              : () {
                                  _controller!.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                      setState(() {
                                        isPressed= false;
                                      });
                                }
                          : null,
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(color: Colors.orange, width: 1.0)
                      ),
                      child: Text(
                        index + 1 == questions.length
                            ? "Mirar resultado: "
                            : "Sigueinte pregunta",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
