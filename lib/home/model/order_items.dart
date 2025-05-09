class OrderItem {
  final String? itemName;
  final String? icon; 
  final String? category;
  final String? price;
  final String? description;
  final String? type;
  final String? size;
  final String? quantity;
  final String? addonItem;
  final String? addons;

  OrderItem({
    this.itemName,
    this.icon,
    this.category,
    this.price,
    this.description,
    this.type,
    this.size,
    this.quantity,
    this.addonItem,
    this.addons,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      itemName: json['itemName'],
      icon: json['icon'],
      category: json['category'],
      price: json['price'],
      description: json['description'],
      type: json['type'],
      size: json['size'],
      quantity: json['quantity'],
      addonItem: json['addonItem'],
      addons: json['addons'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemName': itemName,
      'icon': icon,
      'category': category,
      'price': price,
      'description': description,
      'type': type,
      'size': size,
      'quantity': quantity,
      'addonItem': addonItem,
      'addons': addons,
    };
  }
}
