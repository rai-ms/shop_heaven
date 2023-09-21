import 'package:shop_heaven/utils/random_no_generator.dart';

class Cart {
  int id;
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

  static List<String> productNames = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grapes',
    'Kiwi',
    'Mango',
    'Orange',
    'Peach',
    'Strawberry',
    'Blueberry',
    'Pineapple',
    'Watermelon',
    'Lemon',
    'Avocado',
    'Raspberry',
    'Cranberry',
    'Pear',
    'Apricot',
  ];

  static List<String> productUnits = [
    'KG', // Apple
    'KG', // Banana
    'KG', // Cherry
    'KG', // Date
    'KG', // Grapes
    'KG', // Kiwi
    'KG', // Mango
    'KG', // Orange
    'KG', // Peach
    'KG', // Strawberry
    'dozen', // Blueberry
    'piece', // Pineapple
    'KG', // Watermelon
    'KG', // Lemon
    'piece', // Avocado
    'KG', // Raspberry
    'KG', // Cranberry
    'KG', // Pear
    'dozen', // Apricot
  ];

  static List<int> productPrices = GenerateRandom.getRandomListInt(100, 200, 20);

  static List<String> productImages = [
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
    'https://m.media-amazon.com/images/I/51ebZJ+DR4L._AC_UF1000,1000_QL80_.jpg',
    'https://media.istockphoto.com/id/172315512/photo/sweet-cherries.jpg?s=612x612&w=0&k=20&c=qz6b92ZkcMTH5XtZUMI7CW7CQPkYFo1qAWoHX48VQk4=',
    'https://images.immediate.co.uk/production/volatile/sites/30/2020/02/dates-resized-14ee31f.jpg?quality=90&resize=556,505',
    'https://media.istockphoto.com/id/803721418/photo/grape-dark-grape-grapes-with-leaves-isolated-with-clipping-path-full-depth-of-field.jpg?s=612x612&w=0&k=20&c=-jAJlO3WbgFzxwwSmG3pc7bqUva117TYUKKrQW3-RK8=',
    'https://cdn.britannica.com/45/126445-050-4C0FA9F6/Kiwi-fruit.jpg',
    'https://c.ndtvimg.com/2023-05/3ph40r2_mango_625x300_02_May_23.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=675',
    'https://media.istockphoto.com/id/185284489/photo/orange.jpg?s=612x612&w=0&k=20&c=m4EXknC74i2aYWCbjxbzZ6EtRaJkdSJNtekh4m1PspE=',
    'https://media.istockphoto.com/id/1151868959/photo/single-whole-peach-fruit-with-leaf-and-slice-isolated-on-white.jpg?s=612x612&w=0&k=20&c=RLTbnKnN6w85oXn4qA8y8WYN3OMpGxEDc1nI7VY0gWU=',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Garden_strawberry_%28Fragaria_%C3%97_ananassa%29_single2.jpg/800px-Garden_strawberry_%28Fragaria_%C3%97_ananassa%29_single2.jpg',
    'https://www.chandigarhayurvedcentre.com/wp-content/uploads/2021/03/BLUEBERRY.jpg',
    'https://images.news18.com/ibnlive/uploads/2022/07/shutterstock_1403484713.jpg',
    'https://ayu.health/blog/wp-content/uploads/2023/06/watermelon-isolated-white-clippi-1024x820.webp',
    'https://media.istockphoto.com/id/1406047398/photo/lemon-with-leaf-isolated-on-white-background.webp?b=1&s=170667a&w=0&k=20&c=zszKjT13Ros7Yt_8Ofv2eJdWTYB-DpuCPr8cvWAIgGs=',
    'https://images.unsplash.com/photo-1601039641847-7857b994d704?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXZvY2Fkb3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Raspberry_-_whole_%28Rubus_idaeus%29.jpg/1200px-Raspberry_-_whole_%28Rubus_idaeus%29.jpg',
    'https://www.freshproduceshoppe.com/wp-content/uploads/2018/09/frt-cranberries-pkt-freshproduceshoppe-1024x1024.jpg',
    'https://img.freepik.com/free-vector/vintage-pear-illustration_53876-112720.jpg?w=2000',
    'https://www.freshproduceshoppe.com/wp-content/uploads/2018/09/apricot-freshproduceshoppe-1024x1024.jpg'
  ];

  /// It will returns all the available items 
  static List<Cart> getCartListFromLists() {
    List<Cart> list = [];
    for (int i = 0; i < productNames.length; ++i) {
      list.add(Cart(id: i, image: productImages[i], productId: i.toString(), initialPrice: productPrices[i], productName: productNames[i], productPrice: productPrices[i], quantity: 1, unitTag: productUnits[i]));
    }
    return list;
  }
}
