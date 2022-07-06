import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class QuestionModel {
  String questionText;
  List<String> answers;

  QuestionModel(this.questionText, this.answers);
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      questionIndex++;
    });
    print('Apertou o botão ' + (questionIndex).toString() + '!');
  }

  @override
  Widget build(BuildContext context) {
    List<QuestionModel> questions = [];

    questions.addAll([
      QuestionModel(
          'Qual sua cor favorita?', ['Preto', 'Vermelho', 'Verde', 'Branco']),
      QuestionModel('Qual seu animal favorito?',
          ['Cachorro', 'Gato', 'Galinha', 'Porco', 'Hamster']),
      QuestionModel('Qual sua estação do ano favorita?',
          ['Inverno', 'Primavera', 'Verão', 'Outono']),
    ]);

    return MaterialApp(
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: Colors.black))))),
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first App'),
          ),
          body: Column(children: [
            Question(questions[questionIndex].questionText),
            ...(questions[questionIndex].answers).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.abc),
          )),
    );
  }
}
