/*import 'package:blyndr_app/Miscellaneous/QuizClass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager{
  
  final CollectionReference QuizList = FirebaseFirestore.instance.collection('Quizzes');

    Future<List<Quiz>> getQuizQuestionss() async {
     List<Quiz> completeList = [];
      await QuizList.get().then((QuerySnapshot querySnapshot) {
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
}*/