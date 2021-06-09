import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blyndr_app/Miscellaneous/FetchfromFirestore.dart';
import 'package:blyndr_app/Miscellaneous/QuizClass.dart';


/*class NewTry2 extends StatefulWidget {

  @override
  NewTry2State createState() => NewTry2State();
}

class NewTry2State extends State<NewTry2> {
 /* Stream quizStream;
  List<Quiz> list;
  DatabaseManager databaseManager = new DatabaseManager();
  List<Quiz> my(){
   print('List: $list');
   return list = databaseManager.getQuizQuestionss();
  }*/
  
  final CollectionReference QuizList = FirebaseFirestore.instance.collection('Quizzes');

  List<Quiz> getQuizQuestionss(){
    List<Quiz> completeList = [];
      QuizList.get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.map((document) {
          List<Option> options = [];
          List<dynamic> markOptions = document['Options'];
          print(markOptions);
          markOptions.forEach((element) {
            options.add(
              new Option(optionImage: element['Option Image'], optionName: element['Option Name']),
            );
          });
            completeList.add(Quiz(options: options, question: document['Question']));
            print("Complete List: $completeList");
        });
      });
      return completeList;
       }


  var i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children:<Widget>[
      Container(margin:EdgeInsets.only(top:30)),
      Text('Hey'),
      Text(my().toString()),

      Container(height:700,
      child: StreamBuilder(
            stream: quizStream,
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.none) {
                return Text("No data");
              } 
             else if (snapshot.connectionState == ConnectionState.done) {
               return Column(children:[
              
              //  for(var i in list)
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
            }
    
        ),
      ),
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
}*/
