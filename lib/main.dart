import 'package:flutter/material.dart';
import 'screens/initial_screen.dart';
import 'screens/latest_cases_screen.dart';
import 'package:doom_covid/screens/error_screen_fetching_data.dart';
import 'screens/login_screen.dart';
import 'screens/quiz/quiz_game.dart';
import 'package:doom_covid/screens/myths/know_your_facts.dart';
import 'screens/UnderConstruction.dart';

void main() {
  return runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      routes: {
        InitialScreen.screenName : (context) => InitialScreen(),
        LatestCasesScreen.screenName : (context) => LatestCasesScreen(),
        ErrorScreen.screenName: (context) => ErrorScreen(),
        LoginScreen.screenName: (context) => LoginScreen(),
        QuizGame.screenName: (context) => QuizGame(),
        KnowYourFacts.screenName: (context) => KnowYourFacts(),
        UnderConstruction.screenName: (context) => UnderConstruction(),
      },
      initialRoute: InitialScreen.screenName,
    );
  }
}
