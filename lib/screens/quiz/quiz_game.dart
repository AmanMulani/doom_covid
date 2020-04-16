import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'QuizBrain.dart';

class QuizGame extends StatefulWidget {

  static final String screenName = 'QuizGame';

  @override
  _QuizGameState createState() => _QuizGameState();
}

class _QuizGameState extends State<QuizGame> {

  List <Icon> checkList = [];
  int correctAnswer = 0;
  QuizBrain quiz = new QuizBrain();
  void alerts(){
    int tempScore = correctAnswer;
    setState(() {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Congratulations!",
        content: Text('Your Score: $tempScore', style: TextStyle(color: Colors.white),),
        style: AlertStyle(
          backgroundColor: Color(0xFF0A0E21),
          titleStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )
        ),
        buttons: [
          DialogButton(
            color: Color(0xFFEB1755),
            child: Text(
              "Main Menu",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            width: 120,
          ),
        ],
      ).show();
    });
    checkList = [];
    quiz.resetQuestion();
    correctAnswer = 0;
  }
  void checkAnswer(bool userAnswer) {
    bool correctAns = quiz.getCorrectAnswer();
    if (correctAns == userAnswer) {
      checkList.add(Icon(Icons.check, color: Colors.green,),);
      correctAnswer++;
    }
    else
      checkList.add(Icon(Icons.close, color: Colors.red,),);
    setState(() {
      quiz.incrementQuestion();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Quiz',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 27.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      quiz.getQuestion(),
                      style: TextStyle(color: Colors.white,
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0, right: 90, left: 90, bottom: 12),
                  child: FlatButton(
                    color: Colors.green,
                    child: Text('True',
                      style: TextStyle(color: Colors.white,
                          fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    onPressed: () {
                      setState(() {
                        if(quiz.checkLimit()==false) {
                          checkAnswer(true);
                        }
                        else
                          alerts();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 24, left: 90, right: 90),
                  child: FlatButton(
                    color: Colors.red,
                    child: Text('False',
                      style: TextStyle(color: Colors.white,
                          fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    onPressed: () {
                      setState(() {
                        if(quiz.checkLimit()==false)
                          checkAnswer(false);
                        else
                          alerts();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Wrap(
                  children: checkList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
