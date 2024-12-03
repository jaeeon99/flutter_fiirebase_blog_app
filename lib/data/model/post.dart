class Post {
  String id;
  String title;
  String contants;
  String writer;
  String imageUrl;
  DateTime createdAt;

  Post({
    required this.id,
    required this.title,
    required this.contants,
    required this.writer,
    required this.imageUrl,
    required this.createdAt,
  });

  // 1. forJson 네임드 생성자 만들기
  Post.formJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          title: map['tilte'],
          contants: map['contants'],
          writer: map['writer'],
          imageUrl: map['imageUrl'],
          createdAt: DateTime.parse(map['createAt']),
        );

  // 2. toJson 메서드 만들기
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'contants': contants,
      'writer': writer,
      'imageUrl': imageUrl,
      'createAt': createdAt.toIso8601String(),
    };
  }
}
