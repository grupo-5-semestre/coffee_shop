import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
      name: 'Affogato',
      price: '4.10',
      imagePath: 'lib/imagens/Affogato.png',
    ),
    // latte
    Coffee(
      name: 'Café',
      price: '4.15',
      imagePath: 'lib/imagens/Café.png',
    ),
    // espresso
    Coffee(
      name: 'Café com Leite',
      price: '3.50',
      imagePath: 'lib/imagens/CaféLeite.png',
    ),
    // iced coffee
    Coffee(
      name: 'Cappuccino',
      price: '4.50',
      imagePath: 'lib/imagens/Cappuccino.png',
    ),
  ];

  // Define a lista para armazenar os itens no carrinho do usuário
  List<Coffee> _userCart = [];

// Getter para recuperar a lista de cafés disponíveis (supõe-se que seja uma propriedade privada _shop)
  List<Coffee> get coffeeShop => _shop;

// Getter para acessar o carrinho de compras do usuário
  List<Coffee> get userCart => _userCart;

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
