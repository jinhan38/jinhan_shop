class Item {
  String? name;
  String? author;
  int? price;
  int? stock;

  Item(this.name, this.author, this.price, this.stock);

  factory Item.fromFson(Map<String, dynamic> json) {
    return Item(json["name"], json["author"], json["price"], json["stock"]);
  }
}
