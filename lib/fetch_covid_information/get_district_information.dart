import 'dart:convert';
import 'package:http/http.dart' as http;

class GetDistrictInformation {

  String stateName;
  String districtName;

  GetDistrictInformation({this.districtName, this.stateName});

  static final url = 'https://api.covid19india.org/state_district_wise.json';

  Future<dynamic> getInformation() async {

    //to capitalize the first letter of every string
    stateName = toUpperCase(stateName);
    districtName = toUpperCase(districtName);
    http.Response response = await http.get(url);
    String districtData = response.body;
    var districtDataDecode = jsonDecode(districtData);
//    print(districtDataDecode["Kerala"]['districtData']['Thrissur']);

    if(response.statusCode == 200) {
      return districtDataDecode[stateName]['districtData'][districtName];
    }
    else
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

//alternative methods:
//  String state = 'Maharashtra';
//  String district = 'Mumbai';
//  var districtList = [];
//  districtDataDecode[state]['districtData'][district].forEach((k, v) => districtList.add(DistrictData(k, v)));
//  print(districtList);
//class DistrictData {
//  var mapData;
//  var state;
//  DistrictData(this.state, this.mapData);
//
//  @override
//  String toString() {
//    return  '${this.mapData}';
//  }
//}