import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

 

 class DatabaseHelper {

   _save(String quality, String gpt) async {
    final perfs = await SharedPreferences.getInstance();
    final keyquality = 'quality';
    final valuequality = quality;
    final keygpt = 'gpt';
    final valuegpt = gpt;
    perfs.setString(keyquality, valuequality);
    perfs.setString(keygpt, valuegpt);
  }



  var responseBody;
  var status;
  String serverUrl = 'http://54.93.213.88/soil';
  Uri uri = Uri.parse('http://54.93.213.88/soil');
  
  // Uri uri = Uri.parse('http://127.0.0.1:5000/soil');
  applydara(var N_nitrogen, var P_phosphorous, var K_Potassium, var PH_value) async {
    Map<String, dynamic> body = {
      "N": N_nitrogen,
      "P": P_phosphorous,
      "K": K_Potassium,
      "pH": PH_value
    };
    print(uri);
    print(json.encode(body));
      http.Response response = await http.post(uri,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(body)
      ).timeout(Duration(seconds: 50));

      status = response.statusCode;

    var data = json.decode(response.body);
    print(data.toString);
    if (status != 200) {
      print('error : ${data["error"]}');
    } else {
      var quality = data['message'];
      var gpt = data['data']['content'];
      print('quality : ${data["message"]} gpt : - ${data['data']["content"]}');
      _save(quality, gpt,);
    }
  }
 }