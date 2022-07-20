import 'dart:convert';
import 'dart:io';
import '../model/corona_data_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
 static CoronaDataModel _coronaDataModel = CoronaDataModel();
  static const String _url = 'https://api.covid19api.com/summary';

  static final _client = http.Client();

  static Future<CoronaDataModel> fetchData() async {
    final response = await _client.get(Uri.parse(_url));
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData != null) {
          _coronaDataModel = CoronaDataModel.fromJson(jsonData);
        }
      } else {
        return _coronaDataModel;
        throw Exception('Something Went Wrong Bro');
      }
    } on SocketException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
    return _coronaDataModel;
  }
}
