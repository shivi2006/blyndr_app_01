class Quiz {
  final String question;
  final List<Option> options;

  Quiz({this.options, this.question});
}

class Option {
  
  final String optionImage;
  final String optionName;

  Option({this.optionName, this.optionImage});
}
