class Person {
  int id;
  String title;
  String body;

  Person({this.id, this.title, this.body});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      title: json['title'],
      body :json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.title;
    data['phone'] = this.body;
    return data;
  }
}