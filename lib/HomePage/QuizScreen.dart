import 'package:flutter/material.dart';
import 'package:blyndr_app/Miscellaneous/FetchfromFirestore.dart';
import 'package:blyndr_app/Miscellaneous/QuizClass.dart';
class QuizScreen extends StatefulWidget {
  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  Stream quizStream;
  DatabaseManager databaseService = new DatabaseManager();
  
  // ignore: non_constant_identifier_names
  Widget QuestionAndOptions() {
    return Column(children: <Widget>[
      Container(
        child: Card(
       //   child: Text(databaseService.getQuizQuestions()[0]),
    )
      ),
      Container(
        margin: EdgeInsets.only(top:30),
        child: StreamBuilder(
            stream: quizStream,
            builder: (context, snapshot) {
              return ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: OptionTile(
                        //  noOfOptions: snapshot.data.docs.data()[''],
                          imageUrl:
                              snapshot.data.docs[index].data()['QuizImage'],
                          option1:
                              snapshot.data.docs[index].data()['option1'],
                        ),
                        );
                      }
                      );
                      },
          )
    )
    ]
    );
  }

  @override
  void initState() {
    databaseService.getQuizQuestions().then((value) {
      quizStream = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children:<Widget>[
      Container(margin:EdgeInsets.only(top:30)),
      Container(child:QuestionAndOptions(), height: 800,),
      Padding(padding:EdgeInsets.all(15)),
      Row(children:<Widget> [
        ElevatedButton(
        child:Text("Back"),
        onPressed: (){},
      ),
      ElevatedButton(child:Text("Next"),
      onPressed: () {
      
      },
      )
       ]
       ),
      ]
      )
    );
  }
}

class OptionTile extends StatelessWidget {
  final String imageUrl, title;
  final int noOfQuestions;

  OptionTile(
      {@required this.title,
      @required this.imageUrl,
      @required this.noOfQuestions});

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
                imageUrl,
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
                        title,
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