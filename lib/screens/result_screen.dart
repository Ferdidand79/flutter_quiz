import 'package:flutter/material.dart';
import 'package:flutter_quiz/colors/color.dart';
import 'package:flutter_quiz/pages/home.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Felicitaciones",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Tú score es:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(height: 50.0),
              Text(
                "${widget.score}",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 60.0),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                elevation: 0.0,
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("Repetir el Quizz"),
              ),
            ],
          ),
        ));
  }
}
