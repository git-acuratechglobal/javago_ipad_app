class AddonSize {
  String? name;
  int? price;

  AddonSize({this.name, this.price});

  factory AddonSize.fromJson(Map<String, dynamic> json) {
    return AddonSize(
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
}

class Orders {
  int? itemId;
  int? cafeMenuId;
  String? itemName;
  String? itemSize;
  String? itemType;
  String? itemImage;
  List<AddonSize>? addonSizes;
  int? itemAmount;
  String? itemCategory;
  int? itemQuantity;
  String? itemDescription;
  int? isSuggestedItem;

  Orders({
    this.itemId,
    this.cafeMenuId,
    this.itemName,
    this.itemSize,
    this.itemType,
    this.itemImage,
    this.addonSizes,
    this.itemAmount,
    this.itemCategory,
    this.itemQuantity,
    this.itemDescription,
    this.isSuggestedItem,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      itemId: json['item_id'],
      cafeMenuId: json['cafe_menu_id'],
      itemName: json['item_name'],
      itemSize: json['item_size'],
      itemType: json['item_type'],
      itemImage: json['item_image'],
      addonSizes: json['addon_sizes'] != null
          ? (json['addon_sizes'] as List).map((v) => AddonSize.fromJson(v)).toList()
          : [],
      itemAmount: json['item_amount'],
      itemCategory: json['item_category'],
      itemQuantity: json['item_quantity'],
      itemDescription: json['item_description'],
      isSuggestedItem: json['is_suggested_item'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'item_id': itemId,
      'cafe_menu_id': cafeMenuId,
      'item_name': itemName,
      'item_size': itemSize,
      'item_type': itemType,
      'item_image': itemImage,
      'addon_sizes': addonSizes?.map((v) => v.toJson()).toList(),
      'item_amount': itemAmount,
      'item_category': itemCategory,
      'item_quantity': itemQuantity,
      'item_description': itemDescription,
      'is_suggested_item': isSuggestedItem,
    };
  }
}

class OrderDetails {
  String? status;
  String? message;
  List<Orders>? orders;

  OrderDetails({this.status, this.message, this.orders});

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      status: json['status'],
      message: json['message'],
      orders: json['orders'] != null
          ? (json['orders'] as List).map((v) => Orders.fromJson(v)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'orders': orders?.map((v) => v.toJson()).toList(),
    };
  }
}
