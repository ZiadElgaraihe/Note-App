class NoteModel {
  final String id;
  String title;
  String content;
  int backgroundColor; //Hex color

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.backgroundColor,
  });

  factory NoteModel.fromJson(Map<String, dynamic> data) {
    return NoteModel(
      id: data['id'],
      title: data['title'],
      content: data['content'],
      backgroundColor: data['color'],
    );
  }
}
