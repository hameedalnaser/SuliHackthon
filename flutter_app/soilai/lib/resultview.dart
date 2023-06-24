import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
 String stringValue1 = '';
  String stringValue2 = '';

  @override
  void initState() {
    super.initState();
    loadStringValues();
  }

  Future<void> loadStringValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if(prefs.getString('quality') != null)
      stringValue1 = prefs.getString('quality')!;
      if(prefs.getString('gpt') != null) // Replace 'key1' with the key for the first string
      stringValue2 = prefs.getString('gpt')!;
      print(stringValue1); // Replace 'key2' with the key for the second string
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('String Value 1: ${stringValue1}'),
            Text('String Value 2: ${stringValue2}'),
          ],
        ),
      ),
    );
  }
}
