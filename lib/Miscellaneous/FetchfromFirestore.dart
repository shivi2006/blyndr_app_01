import 'package:blyndr_app/Miscellaneous/QuizClass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager{
  
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
      }
      );
      return completeList;

       }

        /* Future<Stream<QuerySnapshot>> getQuizData() async {
         return await FirebaseFirestore.instance.collection("Quizzes").snapshots();*/
  }




/*class Firebase{
   List<Quiz> firebaseQuizFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      List<Options> options = [];
      List<dynamic> markOptions = doc.data['Options'];
      markOptions.forEach((element) {
        options.add(new Options(
            optionImage = element['Option Image'],
            optionName = element['Option Name'],
        ));
      });
      return Quiz(
        question: doc.data['Question'] ?? '',
        options: options,
      );
    }).toList();
  }
}class DatabaseManager{
  
  final CollectionReference QuizList = FirebaseFirestore.instance.collection('Quizzes');

  Future getQuizQuestions() async{
    List questionList = [];
    List optionsList= [];
    try {
      await QuizList.get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((document) {
          print(document['Question']);
          // Adding the questions to a list
          questionList.add(document['Question']);
          // Adding the options 
          
        });
      });
      return questionList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}*/
