import 'package:flutter/material.dart';
import 'package:doom_covid/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {

  static final String screenName = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String phoneNumber;
  String verificationId;
  String smsCode;

  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/loginLogo.png', width: 150, height: 300,),

            Text(
              'Doom Covid',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 10,
            ),

            Text(
              'Let\'s fight together!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(Icons.phone_android),
                title:TextField(
                  keyboardType: TextInputType.phone,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Enter '
                        'Enter Your Phone Number',
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
                    phoneNumber = value;
                  },
                ),
              ),
            ),


            codeSent ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Icon(Icons.phone_android),
                title:TextField(
                  keyboardType: TextInputType.phone,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Enter '
                        'Enter the OTP',
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
                    smsCode = value;
                  },
                ),
              ),
            ) : Container(),


            Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
              child: RaisedButton(
                onPressed: () {
                  codeSent ? AuthService().signInWithOTP(smsCode, verificationId): verifyPhone(phoneNumber);
                },
                padding: EdgeInsets.all(14.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24
                    ))
                ),
                color: Color(0xFFEB1755),
                elevation: 16.0,
                child: Center(child: codeSent ? Text('Login', style: TextStyle(fontSize: 18),):Text('Verify', style: TextStyle(fontSize: 18),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
