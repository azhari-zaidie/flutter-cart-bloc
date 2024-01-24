class ProductDataModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  ProductDataModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.price});

  //code below guna untuk setkan satu je wishlist or cart boleh insert
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDataModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          price == other.price &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      imageUrl.hashCode;
}
