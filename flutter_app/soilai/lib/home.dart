import 'dart:convert';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:soilai/resultview.dart';
// import 'package:http/http.dart' as http;
import 'controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

Route<dynamic> _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}




  bool isLoading = false;

  DatabaseHelper databaseHelper = new DatabaseHelper();


  final _formKey = GlobalKey<FormState>();

  var N_nitrogen;
  var P_phosphorous;
  var K_Potassium;
  var PH_value;
  var result;
   void _submit() {
    setState(() {
    isLoading = true;
    });
    final form = _formKey.currentState;
    // print("nitrogen value"+N_nitrogen);
    if (form != null && form.validate()) {
      form.save();
      // print('Username: $_username, Email: $_phonenumber, Password: $_password');
      databaseHelper.applydara(N_nitrogen, P_phosphorous, K_Potassium,PH_value).whenComplete((){
        setState(() {
          isLoading = false;
        });
        if(databaseHelper.status == 200){
        // result = databaseHelper.responseBody;
        // var obresult = jsonDecode(result);
        Navigator.of(context).push(_createRoute(
                         NewPage()));
      //  print(obresult);
        
      }else{
       showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('Operation failed, please try again'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }});
    }
  }


  @override
  Widget build(BuildContext context) { 
    return 
    Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(46, 204, 64, 100),
        title: Text('SoilAI', style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Color.fromRGBO(77, 51, 31, 1))),
        // leading: IconButton(icon: Icon(Icons.home,size: 32,color: Colors.black87,),
        // onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>Layout_Page()));}
        // ),
        centerTitle: true,),
        body: isLoading ? Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          CircularProgressIndicator(),
          SizedBox(height: 80,),
          Text("Loading...")
        ]),):
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
                child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(children: [

                          Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Theme(
                    data: new ThemeData(
                      primaryColor: Color.fromRGBO(77, 51, 31, 1),
                      primaryColorDark: Color.fromRGBO(77, 51, 31, 1),
                    ),
                    child: 
        TextFormField(
            onSaved: (val) => N_nitrogen = val,
            keyboardType: TextInputType.number,
            validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null; // Return null if the value is valid
                  },
            decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(77, 51, 31, 1))
                ),
                border: OutlineInputBorder(),
                labelText: 'Nitrogen Content (ppm)',
                icon: Icon(Icons.nature, color: Color.fromRGBO(77, 51, 31, 1)))))),
                        
                        
                          Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Theme(
                    data: new ThemeData(
                      primaryColor: Color.fromRGBO(77, 51, 31, 1),
                      primaryColorDark: Color.fromRGBO(77, 51, 31, 1),
                    ),
                    child: 
        TextFormField(
            onSaved: (val) => P_phosphorous = val,
            keyboardType: TextInputType.number,
            validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null; // Return null if the value is valid
                  },
            decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(77, 51, 31, 1))
                ),
                border: OutlineInputBorder(),
                labelText: 'Phosphorous Content (ppm)',
                icon: Icon(Icons.nature, color: Color.fromRGBO(77, 51, 31, 1)))))),
                        

                        
                          Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Theme(
                    data: new ThemeData(
                      primaryColor: Color.fromRGBO(77, 51, 31, 1),
                      primaryColorDark: Color.fromRGBO(77, 51, 31, 1),
                    ),
                    child: 
        TextFormField(
            onSaved: (val) => K_Potassium = val,
            keyboardType: TextInputType.number,
            validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null; // Return null if the value is valid
                  },
            decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(77, 51, 31, 1))
                ),
                border: OutlineInputBorder(),
                labelText: 'Potassium Content (ppm)',
                icon: Icon(Icons.nature, color: Color.fromRGBO(77, 51, 31, 1)))))),
                        

                        
                          Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Theme(
                    data: new ThemeData(
                      primaryColor: Color.fromRGBO(77, 51, 31, 1),
                      primaryColorDark: Color.fromRGBO(77, 51, 31, 1),
                    ),
                    child: 
        TextFormField(
          
            onSaved: (val) => PH_value = val,
            keyboardType: TextInputType.number,
            validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null; // Return null if the value is valid
                  },
            decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(77, 51, 31, 1))
                ),
                border: OutlineInputBorder(),
                labelText: 'PH value (ph)',
                icon: Icon(Icons.nature, color: Color.fromRGBO(77, 51, 31, 1)))))),
                        
                  Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(children: [
          ButtonTheme(height: 50,
             buttonColor: Color.fromRGBO(77, 51, 31, 1),
            minWidth: MediaQuery.of(context).size.width-20,
              child: ElevatedButton(
                style: ButtonStyle(
                   minimumSize: MaterialStateProperty.all<Size>(Size(300, 40)),
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(46, 204, 64, 100))),
              child: Text('Apply',
                textAlign: TextAlign.center ,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(77, 51, 31, 1),),),
              // elevation: 8.0,
              // color: Theme.of(context).primaryColor,
              onPressed: _submit
              ),),]))
             

                        ]
                        )
                    )
                )
            )
        )
    );
  }
}