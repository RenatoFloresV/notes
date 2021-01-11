class Note {
  int id;
  String title;
  String content;
  int status; // 0 - Incomplete, 1 - Complete

  Note({this.title, this.content, this.status});
  Note.withId({this.id, this.title, this.content,this.status });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['content'] = content;
    map['status'] = status;
    return map;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note.withId(
        id: map['id'], title: map['title'], content: map['content'], status: map['status']);
  }
}
