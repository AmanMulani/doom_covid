import 'package:doom_covid/screens/input_state_screen.dart';
import 'package:flutter/material.dart';
import 'package:doom_covid/screens/input_distrcit_screen.dart';

class LatestCasesScreen extends StatelessWidget {
  static final screenName = 'LatestCasesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[

          //Corona Image
          Image.asset('images/coronaVirusImage.png'),


          SizedBox(
              height: 10,
          ),

          //Heading
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              'Latest Cases Update',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),


          //State Cases
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 30, 50, 20),
            child: RaisedButton(
              padding: EdgeInsets.all(16),
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              onPressed: (){
                showModalBottomSheet(context: context, builder: (BuildContext context){
                  return InputStateScreen();
                });
              },
              color: Color(0xFFEB1755),
              child: Text(
                'State Statistics',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),


          //District Cases
          Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
            child: RaisedButton(
              padding: EdgeInsets.all(16),
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              onPressed: () {
                showModalBottomSheet(context: context, builder: (BuildContext context){
                  return InputDistrictScreen();
                });
              },
              color: Color(0xFFEB1755),
              child: Text(
                'District Cases',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
