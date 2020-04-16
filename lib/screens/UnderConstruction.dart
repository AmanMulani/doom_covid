import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {

  static final String screenName = 'UnderConstruction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/underConstructionLogo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
