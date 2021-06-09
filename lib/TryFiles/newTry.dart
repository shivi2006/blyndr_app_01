import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blyndr_app/Miscellaneous/FetchfromFirestore.dart';
import 'package:blyndr_app/Miscellaneous/QuizClass.dart';

class NewTry extends StatefulWidget {

  @override
  NewTryState createState() => NewTryState();
}

class NewTryState extends State<NewTry> {
  Stream quizStream;
  DatabaseManager databaseManager = new DatabaseManager();

  List<Quiz> list;
  var i;
  
 /* void initState() {
    list = databaseManager.getQuizQuestionss();
    print(list);
    super.initState();
  }*/
  // ignore: non_constant_identifier_names
  
  Widget QuestionAndOptions() {
      
      Container(
        child: StreamBuilder(
            stream: quizStream,
            builder: (context, snapshot) {
              return Column(children:[
                //for(var i in snapshot.data.docs.size)
                Container(
                  child: Card(child: Text(snapshot.data.docs.data()['Question'])),),
                //List of Options.Loop is to run all options. Do not Chnage the loop.
                ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: snapshot.data.docs.data()['Options'].size,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                         // child: Column(children: [
                           // for (i in snapshot.data.docs[index].data()['Options'])
                            child: OptionTile(
                              optionImage:
                              snapshot.data.docs.data()['Options'][index][0],
                              optionName:
                              snapshot.data.docs.data()['Options'][index][1],
                        ),
                         // ]
                        //  ),
                       );
                      }
                ),
                // Next and Back Buttons
                Container(child:  
                  Row(children:<Widget> [
                      ElevatedButton(
                      child:Text("Back"),
                      onPressed: (){
                       // curent_value = index+1;
                      },
                       ),
                       ElevatedButton(child:Text("Next"),
                      onPressed: () {
                        
                      }
                       ),
                  ]
                  )
                )
              ]
              );
            }
        ),
      );
      
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children:<Widget>[
      Container(margin:EdgeInsets.only(top:30)),
      Text('Hey'),
      Container(child:QuestionAndOptions(), height:700,),
      ]
      )
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