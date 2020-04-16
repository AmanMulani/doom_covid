import 'package:flutter/material.dart';
import 'package:doom_covid/screens/district_data_screen.dart';
import 'package:doom_covid/fetch_covid_information/get_district_information.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:doom_covid/screens/error_screen_fetching_data.dart';

class InputDistrictScreen extends StatefulWidget {

  @override
  _InputDistrictScreenState createState() => _InputDistrictScreenState();
}

class _InputDistrictScreenState extends State<InputDistrictScreen> {

  String stateName;
  String districtName;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Color(0xFF0A0E21),
          child: Column(
            children: <Widget>[

              //Title
              Text(
                'District COVID-19 Tracker',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),


              //Input State Name
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
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


              //Input District Screen
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 24),
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Enter District Name',
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
                    districtName = value;
                  },

                ),
              ),


              //Submit Button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15.0)
                      )
                  ),
                  onPressed: () async{
                    if(stateName != null && districtName!=null) {
                      setState(() {
                        showSpinner = true;
                      });
                      var districtData = await GetDistrictInformation(stateName: stateName, districtName: districtName).getInformation();

                      if(districtData == null) {
                        Navigator.pushNamed(context, ErrorScreen.screenName);
                      }
                      else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return DistrictDataScreen(
                                    districtData: districtData,
                                    stateName: stateName,
                                    districtName: districtName,
                                  );
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
