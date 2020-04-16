import 'package:flutter/material.dart';

class StateDataScreen extends StatefulWidget {

  final stateData;

  StateDataScreen({@required this.stateData,});

  @override
  _StateDataScreenState createState() => _StateDataScreenState();
}

class _StateDataScreenState extends State<StateDataScreen> {

//  var stateDataObject = GetStateInformation();


  @override
  Widget build(BuildContext context) {

    var stateInfo = widget.stateData;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                color: Colors.white10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                elevation: 10.0,
                child: Container(
                  height: 250,
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      color: Colors.white10,
                  ),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8.0),
                        child: Text(
                          'STATE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                        child: Text(
                          stateInfo['state'].toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36,
                          ),
                        ),
                      ),

                      Text(
                        'State Analysis',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: <Widget>[
                  DisplayInfoCard(
                      info: stateInfo['confirmed'],
                      title: 'TOTAL CASES',
                  ),
                  DisplayInfoCard(
                    info: stateInfo['active'],
                    title: 'ACTIVE CASES',
                  ),
                  DisplayInfoCard(
                    info: stateInfo['deaths'],
                    title: 'DEATHS',
                  ),
                  DisplayInfoCard(
                    info: stateInfo['recovered'],
                    title: 'RECOVERED',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayInfoCard extends StatelessWidget {


  DisplayInfoCard({@required this.info, @required this.title});

  final String info;
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            color: Colors.white10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  info,
                  style: TextStyle(
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
