import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {

  //////////// Server Api ///////
  final String _url = 'https://mobile.hombolttech.net/';
  final String mapurl = 'https://maps.googleapis.com/maps/api/geocode/json';

  ///////// Local Api ///////
  // 'http://10.0.2.2:8000/app/';


  getAddress(apiUrl) async {
    var apiMainUri = mapurl + apiUrl;
    print(apiMainUri);
    return await http.get(apiMainUri, headers: _setHeaders());
  }

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    print("full post data url is : $fullUrl");

    return await http.post(fullUrl,
        body: jsonEncode(data), headers: await _setHeaders());
  }

  postDataWithToken(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    print("full post data url with token is : $fullUrl");

    return await http.post(fullUrl,
        body: jsonEncode(data), headers: await _setHeaders());
  }

  getDataWithToken(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    print("full get data url with token is : $fullUrl");

    return await http.get(fullUrl, headers: await _setHeaders());
  }

  getDataWithDateNToken(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getTokenN();
    print("full get data url with date & token is : $fullUrl");

    return await http.get(fullUrl, headers: await _setHeaders());
  }

  getDataWithId(apiUrl, id) async {
    var fullUrl = _url + apiUrl + id;
    print("full get data url with id is : $fullUrl");

    return await http.get(fullUrl, headers: await _setHeaders());
  }

  getDataWithTokenNPercent(apiUrl, percent) async {
    var fullUrl = _url + apiUrl + await _getToken() + percent;
    print("full get data url with token & percent is : $fullUrl");

    return await http.get(fullUrl, headers: await _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;

    print("full get data url is: $fullUrl");
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  // _setHeadersWithToken() async => {
  //       "Authorization": 'Bearer ' + await _getToken(),
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  // };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print('token string  -- ${localStorage.getString('token')}');

    var token = localStorage.getString('token');
    return '?token=$token';
  }

  _getTokenN() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print('token string  -- ${localStorage.getString('token')}');
    var token = localStorage.getString('token');
    return '&token=$token';
  }
}
