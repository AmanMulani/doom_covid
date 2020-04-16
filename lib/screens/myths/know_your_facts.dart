import 'package:flutter/material.dart';
import 'facts_collection.dart';
import 'dart:math';

class KnowYourFacts extends StatefulWidget {

  static final String screenName = 'KnowYourFacts';
  @override
  _KnowYourFactsState createState() => _KnowYourFactsState();
}

class _KnowYourFactsState extends State<KnowYourFacts> {

  int index = Random().nextInt(facts.length);

  void generateImageNumber() {
    index = Random().nextInt(facts.length);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        child: Center(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 10.0,
                color: Colors.white10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      color: Colors.white10,
                    ),
                    padding: EdgeInsets.all(18),
                    child: SingleChildScrollView(
                      child: Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Did You Know?',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              color: Colors.greenAccent
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            thickness: 4.0,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                            child: Text(
                              facts[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: RaisedButton(
                  onPressed: (){
                    setState(() {
                      generateImageNumber();
                    });
                  },
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 27.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: Text('Next Fact>>',
                    style: TextStyle(color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),

              RaisedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Text('<< Main Menu',
                  style: TextStyle(color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
