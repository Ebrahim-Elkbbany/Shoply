class SQLModel {
  int? id;
  late String title;
  late String image;
  late double price;

  SQLModel({
    this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  SQLModel.fromMap(Map<String , dynamic> map){
    if (id != null)id = map['id'];
    title = map['title'];
    image = map['image'];
    price = map['price'];
  }

  Map <String , dynamic> toMap(){
    Map <String , dynamic> map = {};
    if (map['id'] != null) map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['price'] = price;
    return map;
  }
}