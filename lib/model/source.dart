class Sources{
  dynamic id;
  String? name;

  Sources({this.id, this.name});

  Sources.fromJson(Map<String, dynamic> json):
      id = json.containsKey("id") ? json["id"] : null,
      name = json.containsKey("name") ? json["name"] : null;

  Map<String, dynamic> toJson() =>{
    "id" : id,
    "name" : name
  };

}