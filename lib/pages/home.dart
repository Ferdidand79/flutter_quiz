import 'package:flutter/material.dart';
import 'package:flutter_quiz/colors/color.dart';
import 'package:flutter_quiz/data/question_list.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Pregunta ${index+1}/${questions.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 28.0,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
