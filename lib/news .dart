class News {
  String? author = "";
  String? title = "";
  String? description = "";
  String? imageUrl = "";
  String? date = "";
  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.date,
      });

  factory News.fromMap(Map<String, dynamic> data) {
    return News(
        author: data['author'] ?? "",
        title: data['title'] ?? "",
        description: data['description'] ?? "",
        imageUrl: data['urlToImage'] ?? "",
        date: data['publishedAt'] ?? "",);
  }

  // toMap(News newsObject) {
  //   return {'src': newsObject.title};
  // }
  //
  // Map<String, dynamic> dataMap = {'src': "msmkkd", 'numbers': 2};
}
