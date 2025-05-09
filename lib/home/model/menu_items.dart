class MenuItem {
  final String image;
  final String name;
  final String category;
  final String price;
  final String desc;
  final String tag;
  final String tagIcon;

  MenuItem({
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.desc,
    required this.tag,
    required this.tagIcon,
  });

  // Optional: factory to convert from Map if you need
  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      image: map['image'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      price: map['price'] as String,
      desc: map['desc'] as String,
      tag: map['tag'] as String,
      tagIcon: map['tagIcon'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'category': category,
      'price': price,
      'desc': desc,
      'tag': tag,
      'tagIcon': tagIcon,
    };
  }
}
