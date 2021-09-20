import 'package:test_app/model/source.dart';

class Articles{
  Sources? sources;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({this.sources, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content});

  Articles.fromJson(Map<String, dynamic> json):
      sources = Sources(name: json["name"], id: json["id"]),
      author = json.containsKey("author") ? json["author"] : "",
        title = json.containsKey("title") ? json["title"] : "",
        description = json.containsKey("description") ? json["description"] : "",
      url = json.containsKey("url") ? json["url"] : "",
      urlToImage = json.containsKey("urlToImage") ? json["urlToImage"] : "",
      publishedAt = json.containsKey("publishedAt") ? json["publishedAt"] : "",
      content = json.containsKey("content") ? json["content"] : "";

  Map<String, dynamic> toJson() => {
    "author" : author,
    "title" : title,
    "description" : description,
    "url" : url,
    "urlToImage" : urlToImage,
    "publishedAt" : publishedAt,
    "content" : content,
  };

}