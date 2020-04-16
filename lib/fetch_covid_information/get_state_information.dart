import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:flutter/material.dart';

class GetStateInformation {

  String stateName;

  GetStateInformation({this.stateName});

  static final url = 'https://api.covid19india.org/data.json';

  Future<dynamic> getInformation() async{

    //Capitalize the first letter of each word
    stateName = toUpperCase(stateName);

    http.Response response = await http.get(url);
    String data = response.body;
    var dataDecode = jsonDecode(data);
    int length = dataDecode['statewise'].length;

    if(response.statusCode == 200) {

      for(int index = 0; index<length; index++) {

        if(dataDecode['statewise'][index]['state'] == stateName) {
          return dataDecode['statewise'][index];
        }
      }
    }
    return null;
  }

  String toUpperCase(String string) {
    List<String> listOfWords = string.split(' ');
    String newString = '';
    for(int i = 0; i<listOfWords.length; i++) {
      newString = newString + listOfWords[i][0].toUpperCase() + listOfWords[i].substring(1).toLowerCase() + ' ';
    }
    newString = newString.trim();
    return newString;
  }
}

