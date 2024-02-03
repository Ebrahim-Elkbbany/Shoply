class SQLModel {
  late int id;
  late String title;
  late String image;
  late double price;

  SQLModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  SQLModel.fromMap(Map<String , dynamic> map){
    id = map["id"];
    title = map['title'];
    image = map['image'];
    price = map['price'];
  }

  Map <String , dynamic> toMap(){
    Map <String , dynamic> map = {};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['price'] = price;
    return map;
  }
}