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
      id: json['id']?.toString() ?? '',
      photos: json['photos'] == null
          ? []
          : List<String>.from(json['photos'].map((e) => e.toString())),
      title: json['title'] ?? 'Untitled',
      currentPrice: (json['current_price'] != null)
          ? double.tryParse(json['current_price'].toString()) ?? 0.0
          : 0.0,
      rating: 2.0,
    );
  }
}
