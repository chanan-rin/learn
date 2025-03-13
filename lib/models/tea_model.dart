class TeaModel {
  String title;
  String subtitle;
  bool isDone;

  TeaModel({required this.title, required this.subtitle, required this.isDone});

  Map<String, dynamic> toJson() => {
      'title': title,
      'subtitle': subtitle,
      'isDone': isDone,
  };

  TeaModel.fromJson(Map<String, dynamic> json) : 
    title = json['title'],
    subtitle = json['subtitle'],
    isDone = json['isDone'];
    
}

