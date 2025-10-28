class ProductModel {
  final String id;
  final List<String> photos;
  final String title;
  final double currentPrice;
  final double rating;

  ProductModel({
    required this.id,
    required this.photos,
    required this.title,
    required this.currentPrice,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      photos: List<String>.from(json['photos'].map((e)=>e).toList()),
      title: json['title'],
      currentPrice:json['current_price'],
      rating: 2.0,
    );
  }

}
