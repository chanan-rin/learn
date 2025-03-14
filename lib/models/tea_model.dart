class TeaModel {
  String title;
  String subtitle;
  bool isDone;

  String ? uid;
  String ? docId;

  TeaModel(
    this.title, 
    this.subtitle, 
    this.isDone,
    {
      this.uid,
      this.docId
    });

  Map<String, dynamic> toJson() => {
      'title': title,
      'subtitle': subtitle,
      'isDone': isDone,
      'uid': uid,
      'docId': docId
  };

  TeaModel.fromJson(Map<String, dynamic> json) : 
    title = json['title'],
    subtitle = json['subtitle'],
    isDone = json['isDone'],
    uid = json['uid'],
    docId = json['docId'];
    
}

