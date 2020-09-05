class Quiz {
  Quiz({this.title, this.candidates, this.answer});

  String title;
  List<String> candidates;
  int answer;

  Quiz.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        candidates = map['candidates'],
        answer = map['answer'];
}
