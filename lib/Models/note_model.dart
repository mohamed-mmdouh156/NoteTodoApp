class NoteModel {
  String? title ;
  String? body ;
  String? time ;
  int? color;
  String? status;

  NoteModel({this.title , this.body , this.time , this.color , this.status});

  NoteModel.fromMap (Map <String , dynamic> map){
    title = map['title'];
    body = map['body'];
    time = map['time'];
    color = map['color'];
    status = map['status'];
  }

  Map <String , dynamic> toMap (){
    return {
      'title' : title,
      'body' : body,
      'time' : time,
      'color' : color,
      'status' : status,
    };
  }

}