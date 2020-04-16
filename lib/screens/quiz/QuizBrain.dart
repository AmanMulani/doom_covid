import 'question_object.dart';

class QuizBrain{
  List <QuestionObject> _examQ = [
    QuestionObject(q: 'Can Covid19 spread through Dogs?', a: false),
    QuestionObject(q: 'Covid19 does not affect the youth.', a: false),
    QuestionObject(q: 'Covid19 can be contained bt social distancing.', a: true),
    QuestionObject(q: 'Covid19 spread be stop by drinking warm water daily.', a: false),
    QuestionObject(q: 'Covid19 has no effective vaccine yet.', a: true),
    QuestionObject(q: 'Covid19 is uncurable.', a: false),
    QuestionObject(q: 'Most of the medicines render ineffective against Covid19.', a: true),
    QuestionObject(q: 'Using Soap is a good preventive measure.', a: true),
    QuestionObject(q: 'Covid19 virus can even penetrate through masks.', a: true),
    QuestionObject(q: 'Covid19 is a biological weapon.', a: false),
    QuestionObject(q: 'Covid19 can\'t cause death.', a: false),
  ];

  int _questionNo = 0;

  String getQuestion() {
      return _examQ[_questionNo].question;
  }
  bool getCorrectAnswer() {
    return _examQ[_questionNo].ans;
  }
  int incrementQuestion() {
    if(_questionNo < _examQ.length-1)
      return _questionNo++;
    return _questionNo;
  }
  bool checkLimit() {
    if(_questionNo == _examQ.length - 1) {
      return true;
    }
    return false;
  }
  void resetQuestion() {
    _questionNo = 0;
  }
}