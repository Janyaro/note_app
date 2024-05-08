class NoteModel {
  final int? id;
  final String titleName;
  final String body;

  NoteModel({this.id, required this.titleName, required this.body});

  NoteModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        titleName = res['titleName'],
        body = res['body'];

  Map<String, Object?> toMap() {
    return {'id': id, 'titleName': titleName, 'body': body};
  }
}
