class Coffee {
  final String name;
  final String price;
  final String imagePath;

  Coffee({
    required this.name,
    required this.price,
    required this.imagePath,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      name: json['name'],
      price: json['price'],
      imagePath: json['imagePath'],
    );
  }
}
