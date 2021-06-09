import 'package:blyndr_app/TryFiles/Best.dart';
import 'package:blyndr_app/TryFiles/newTry3.dart';
import 'package:blyndr_app/Miscellaneous/DeviceSizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:blyndr_app/HomePage/QuizScreen.dart';

class HomePage extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //Image
          Container(
           alignment: Alignment(0.0, 0.0),
           height: DeviceSizeConfig.screenHeight*0.8,
           width: DeviceSizeConfig.screenWidth,
           margin: EdgeInsets.only(top:20),
           child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Images')
              .doc('homepage_image') 
              .snapshots(),
        builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print(snapshot.data);
          return new CircularProgressIndicator();
        }
        var document = snapshot.data;
        return Image.network(document.data()["Image"]);
     }
          ),
           ),
        //Sign Up for Quiz Button
        SizedBox(height: 20),
        
        Container(
        alignment: Alignment(0.0, 0.0),
        height:50,
        child: Padding(padding: EdgeInsets.all(8),
        child: ElevatedButton(child:Text('Sign Up for Quiz Now!'),onPressed: (){
          Navigator.push(context, MaterialPageRoute(
          builder: (context) => QuizScreen())
      );
        },),
      )
        ),
      ]
      ),
      );
  }

}