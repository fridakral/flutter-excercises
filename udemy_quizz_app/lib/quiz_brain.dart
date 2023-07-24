import 'package:udemy_quizz_app/question.dart';

class QuizBrain{

  int _questionNumber = 0;

  List<Question> _questionList=[
    Question('Erre a válasz igaz.', true),
    Question('Erre hamis.', false),
    Question('Hazudtam az első kérdésnél?', false),
    Question('Hazudtam valaha?', false)
  ];

  String getQuestion(){
    return _questionList[_questionNumber].question;
  }

  bool getCorrectAnswer(){
    return _questionList[_questionNumber].answer;
  }

  void nextQuestion(){
    if(_questionNumber<_questionList.length-1){
      _questionNumber++;
    }
  }
}