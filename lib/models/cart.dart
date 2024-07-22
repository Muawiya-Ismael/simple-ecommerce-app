
import 'package:flutter/foundation.dart';
import 'package:simple_ecommerce_app/models/shoe.dart';

class Cart extends ChangeNotifier{
  List<Shoe> shoeShop = [
    Shoe(
      name: "Black shoe",
      price: '100',
      description: "A blacke shoe for kids",
      imagePath: "lib/images/black.png",
    ),
    Shoe(
      name: "blue shoe",
      price: '200',
      description: "A blue shoe for kids",
      imagePath: "lib/images/blue.png",
    ),
    Shoe(
      name: "Gray shoe",
      price: '300',
      description: "A gray shoe for kids",
      imagePath: "lib/images/grey.png",
    ),
    Shoe(
      name: "Green shoe",
      price: '400',
      description: "A green shoe for kids",
      imagePath: "lib/images/green.png",
    ),
  ];

  List<Shoe> userCart = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getUserCart() {
    return userCart;
  }

  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }

}