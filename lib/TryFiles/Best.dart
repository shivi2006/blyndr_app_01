import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blyndr_app/Miscellaneous/FetchfromFirestore.dart';
import 'package:blyndr_app/Miscellaneous/QuizClass.dart';


class UserInformation extends StatefulWidget {
  @override
    UserInformationState createState() => UserInformationState();
}

class UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Quizzes').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // Card for the Question
              Padding(padding: EdgeInsets.all(8),
              child:Card(child: Text(document.data.docs.data['Question']) ),

              // List of answers
              ]
            );

          }).toList()
        );
      },
    ),
    );
  }
}


class OptionTile extends StatelessWidget {
  final String optionImage,optionName;

  OptionTile(
      {@required this.optionName,
      @required this.optionImage});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image.network(
                optionImage,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.black26,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        optionName,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 4,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}