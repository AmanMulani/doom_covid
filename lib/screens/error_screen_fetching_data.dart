import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {

  static final String screenName = 'ErrorScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.error_outline,
              size: 200,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Oops!',
              style: TextStyle(
                fontSize: 54,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Something went wrong.',
              style: TextStyle(
                fontSize: 27,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
            child: Text(
              'Possible Reasons: ',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 21,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '---> Check Internet Connectivity.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 21,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '---> Check the input data, and if the input data is correct, then the input data does not exisit on the database.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 21,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '---> Database might be facing issues.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 21,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
