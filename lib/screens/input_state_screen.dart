import 'package:flutter/material.dart';
import 'package:doom_covid/screens/state_data_screen.dart';
import 'package:doom_covid/fetch_covid_information/get_state_information.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:doom_covid/screens/error_screen_fetching_data.dart';

class InputStateScreen extends StatefulWidget {

  @override
  _InputStateScreenState createState() => _InputStateScreenState();
}

class _InputStateScreenState extends State<InputStateScreen> {

  String stateName;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          color: Color(0xFF0A0E21),
          child: Column(
            children: <Widget>[

              //Title
              Text(
                'State COVID-19 Tracker',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),

              //Text Input Here
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 7),
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Enter State Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.redAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    stateName = value;
                  },
                ),
              ),


              //Submit Button
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 7, 24, 24),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15.0)
                      )
                  ),
                  onPressed: () async{
                    if(stateName != null) {
                      setState(() {
                        showSpinner = true;
                      });
                      var stateData = await GetStateInformation(stateName: stateName).getInformation();

                      if(stateData == null) {
                        Navigator.pushNamed(context, ErrorScreen.screenName);
                      }
                      else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return StateDataScreen(stateData: stateData,);
                                }
                            )
                        );
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  },
                  color: Color(0xFFEB1755),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
