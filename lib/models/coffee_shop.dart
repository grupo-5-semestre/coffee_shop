import 'package:flutter/material.dart';
import 'coffee.dart';
import '../api/requests.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [];
  final List<Coffee> _userCart = [];

  CoffeeShop() {
    addProducts();
  }

// Getter para recuperar a lista de cafés disponíveis (supõe-se que seja uma propriedade privada _shop)
  List<Coffee> get coffeeShop => _shop;

// Getter para acessar o carrinho de compras do usuário
  List<Coffee> get userCart => _userCart;

  void addProducts() async {
    List<dynamic> products = await Requests.getProducts();

    for (var product in products) {
      _shop.add(Coffee(
        name: product['name'],
        price: product['price'],
        imagePath: product['image'],
      ));
    }
    notifyListeners();
  }

// Método para adicionar um item ao carrinho
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

// Método para remover um item do carrinho
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
