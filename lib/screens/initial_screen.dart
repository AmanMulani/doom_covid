import 'package:flutter/material.dart';
import 'package:doom_covid/screens/drawer_side_pane.dart';
import 'package:doom_covid/components/card_container.dart';
import 'latest_cases_screen.dart';
import 'quiz/quiz_game.dart';
import 'package:doom_covid/screens/myths/know_your_facts.dart';


class InitialScreen extends StatelessWidget {

  static final String screenName = 'InitialScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEB1755),
        title: Text('Doom Covid', textAlign: TextAlign.center,),
      ),
      drawer: DrawerSidePane(),
      body: ListView(
        children: <Widget>[
          CardContainer(
            label: 'Latest Cases Update',
            imageAddress: 'images/infoLogo.png',
            buttonLabel: 'Get Latest Info',
            onPress: () {
              Navigator.pushNamed(context, LatestCasesScreen.screenName);
            },
          ),
          CardContainer(
            label: 'Check Your Understanding!',
            imageAddress: 'images/quizLogo.png',
            buttonLabel: 'Go To Quiz',
            onPress: () {
              Navigator.pushNamed(context, QuizGame.screenName);
            },
          ),
          CardContainer(
            label: 'Myths Busted!',
            imageAddress: 'images/factsLogo.png',
            buttonLabel: 'Know Your Facts!',
            onPress: (){
              Navigator.pushNamed(context, KnowYourFacts.screenName);
            },
          ),
        ],
      ),
    );
  }
}
