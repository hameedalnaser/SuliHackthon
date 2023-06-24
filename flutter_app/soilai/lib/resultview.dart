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
    if(stringValue1 != null && stringValue1[16]=="0"){
      return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: SingleChildScrollView(child: 
      Container(child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Container(
          color: Color.fromARGB(255, 2, 87, 4), // Background color for the title
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Text('High Soil Fertility',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 20,),
        Container(
           padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: 
          Text('Crops Recommendations:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 234, 238, 239), // Background color for the chat container
          borderRadius: BorderRadius.circular(10.0), // Rounded corners with a radius of 10
        ),

           padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: 
          Text(' ${stringValue2}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),
        ),  
      ],),),),
    );
    //   return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Results'),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text('High Soil Fertility'),
    //         Text('Crops Recommendations: ${stringValue2}'),
    //       ],
    //     ),
    //   ),
    // );
    }else if(stringValue1 != null && stringValue1[16]=="1"){
      return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: SingleChildScrollView(child: 
      Container(child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Container(
          color: Color.fromARGB(255, 109, 107, 6), // Background color for the title
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Text('Medium Soil Fertility',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 50,),
        Container(
           padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: 
          Text('Crops Recommendations:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 234, 238, 239), // Background color for the chat container
          borderRadius: BorderRadius.circular(10.0), // Rounded corners with a radius of 10
        ),
           padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: 
          Text('${stringValue2}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),
        ),  
      ],),),),
    );
    }else{
      return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: SingleChildScrollView(child: 
      Container(child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Container(
          color: const Color.fromARGB(255, 136, 14, 14), // Background color for the title
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Text('Low Soil Fertility',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 50,),
        Container(
           padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: 
          Text('Crops Recommendations:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        Container(
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 234, 238, 239), // Background color for the chat container
          borderRadius: BorderRadius.circular(10.0), // Rounded corners with a radius of 10
        ),
           padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: 
          Text('${stringValue2}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)),
        ),  
      ],),),),
    );
    //   return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Results'),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text('Low Soil Fertility'),
    //         Text('Crops Recommendations: ${stringValue2}'),
    //       ],
    //     ),
    //   ),
    // );
    }
    
  }
}
