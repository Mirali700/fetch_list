class Comments {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  Comments({required this.id, required this.title, required this.albumId,required this.url,required this.thumbnailUrl});

  factory Comments.fromMap(Map<String, dynamic> map) {
    return Comments(
      id: map['id'],
      albumId: map['albumId'],
      title: map['title'],
      url: map['url'],
      thumbnailUrl: map['thumbnailUrl']

      
    );
  }
}
