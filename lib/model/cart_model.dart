class Cart {
  int? id;
  String productId;
  String productName;
  int initialPrice;
  int productPrice;
  int quantity;
  String unitTag;
  String image;
  Cart(
      {required this.id,
      required this.productName,
      required this.image,
      required this.initialPrice,
      required this.productId,
      required this.productPrice,
      required this.quantity,
      required this.unitTag});

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        productName = res['productName'],
        productPrice = res['productPrice'],
        initialPrice = res['initialPrice'],
        quantity = res['quantity'],
        unitTag = res['unitTag'],
        image = res['image'];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "productId": productId,
      "productName": productName,
      "productPrice": productPrice,
      "initialPrice": initialPrice,
      "quantity": quantity,
      "unitTag": unitTag,
      "image": image
    };
  }
}
