class Product{
  int id;
  String name;
  String description;
  String dummyPrice;
  String discountPrice;
  int price;
  String imgUrl;
  int itemQuantity;
  bool isLiked = false;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.dummyPrice,
    required this.discountPrice,
    required this.price,
    required this.imgUrl,
    required this.itemQuantity,
    required this.isLiked,
  });
}