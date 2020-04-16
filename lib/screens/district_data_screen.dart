import 'package:flutter/material.dart';

class DistrictDataScreen extends StatefulWidget {

  final districtData;
  final String districtName;
  final String stateName;

  DistrictDataScreen({@required this.districtData, @required this.stateName, @required this.districtName});

  @override
  _DistrictDataScreenState createState() => _DistrictDataScreenState();
}

class _DistrictDataScreenState extends State<DistrictDataScreen> {

  @override
  Widget build(BuildContext context) {
    var districtData = widget.districtData;
    String stateName = widget.stateName;
    String districtName = widget.districtName;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 75, horizontal: 16),
        child: Center(
          child: Card(
            elevation: 10.0,
            color: Colors.white10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                color: Colors.white10,
              ),
              height: 350,
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'DISTRICT',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                    child: Text(
                      districtName.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    '(${stateName.toUpperCase()})',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    thickness: 2.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'TOTAL CASES',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      districtData['confirmed'].toString(),
                      style: TextStyle(
                        fontSize: 60,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
