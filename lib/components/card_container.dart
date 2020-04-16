import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {

  final String label;
  final String imageAddress;
  final String buttonLabel;
  final Function onPress;
  CardContainer(
      {
        @required this.label,
        @required this.imageAddress,
        @required this.buttonLabel,
        @required this.onPress,
      }
    );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 35.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        color: Colors.white10,
        child: Container(
          height: 275,
          width: double.infinity,
          child: GridTile(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Image.asset(imageAddress),
                ],
              ),
            footer: Padding(
              padding: const EdgeInsets.fromLTRB(80, 10, 80, 15),
              child: RaisedButton(
                elevation: 30,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                color: Color(0xFFEB1755),
                onPressed: onPress,
                child: Text(
                  buttonLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
